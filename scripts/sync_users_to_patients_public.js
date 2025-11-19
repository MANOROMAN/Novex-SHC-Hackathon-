/**
 * Sync 'users' collection into 'patients_public' view for the doctor app.
 * - Copies basic public fields and computes lastAnalysisAt from users/{uid}/analyses.
 *
 * Usage:
 *   npm i firebase-admin (if not installed)
 *   node scripts/sync_users_to_patients_public.js
 *
 * Auth:
 *  - Set GOOGLE_APPLICATION_CREDENTIALS to your serviceAccountKey.json
 *    OR place serviceAccountKey.json in project root.
 */

const admin = require('firebase-admin');
const path = require('path');

try {
  if (!admin.apps.length) {
    if (process.env.GOOGLE_APPLICATION_CREDENTIALS) {
      admin.initializeApp({ credential: admin.credential.applicationDefault() });
    } else {
      const keyPath = path.join(process.cwd(), 'serviceAccountKey.json');
      // eslint-disable-next-line import/no-dynamic-require, global-require
      const serviceAccount = require(keyPath);
      admin.initializeApp({ credential: admin.credential.cert(serviceAccount) });
    }
  }
} catch (e) {
  // eslint-disable-next-line no-console
  console.error('Failed to initialize Firebase Admin SDK:', e);
  process.exit(1);
}

const db = admin.firestore();

async function getLastAnalysisAt(userId) {
  const snap = await db
    .collection('users')
    .doc(userId)
    .collection('analyses')
    .orderBy('createdAt', 'desc')
    .limit(1)
    .get();
  if (snap.empty) return null;
  const doc = snap.docs[0];
  const createdAt = doc.get('createdAt');
  return createdAt || null;
}

function pickDisplayName(userData) {
  // Try common fields safely
  return (
    userData?.displayName ||
    userData?.name ||
    userData?.fullName ||
    'Hasta'
  );
}

function pickAvatarUrl(userData) {
  return (
    userData?.photoUrl ||
    userData?.avatarUrl ||
    ''
  );
}

async function syncOnce(limit = 500) {
  const usersSnap = await db.collection('users').limit(limit).get();
  // eslint-disable-next-line no-console
  console.log(`Found ${usersSnap.size} users (processing up to ${limit})`);

  for (const userDoc of usersSnap.docs) {
    const userId = userDoc.id;
    const userData = userDoc.data() || {};
    const displayName = pickDisplayName(userData);
    const avatarUrl = pickAvatarUrl(userData);
    const lastAnalysisAt = await getLastAnalysisAt(userId);

    await db.collection('patients_public').doc(userId).set(
      {
        displayName,
        avatarUrl,
        lastAnalysisAt: lastAnalysisAt || admin.firestore.FieldValue.delete(),
      },
      { merge: true }
    );
    // eslint-disable-next-line no-console
    console.log(`✓ Upserted patients_public/${userId}`);
  }
}

async function run() {
  try {
    await syncOnce(1000);
    // eslint-disable-next-line no-console
    console.log('✅ Sync completed.');
    process.exit(0);
  } catch (e) {
    // eslint-disable-next-line no-console
    console.error('Sync failed:', e);
    process.exit(1);
  }
}

run();


