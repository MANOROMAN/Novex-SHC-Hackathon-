/**
 * Seed example patients into Firestore (patients_public) using Admin SDK.
 * Usage (PowerShell):
 * 1) Place serviceAccountKey.json in the project root (same folder as this repo)
 * 2) Install deps:
 *    npm init -y
 *    npm i firebase-admin
 * 3) Run:
 *    node scripts/seed_patients_public.js
 */

const admin = require('firebase-admin');
const path = require('path');

// Try auto-load via GOOGLE_APPLICATION_CREDENTIALS; else fall back to local file
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

function ts(date) {
  return admin.firestore.Timestamp.fromDate(date);
}

async function seedPatients() {
  const now = new Date();
  const patients = [
    {
      id: 'patient_demo_001',
      displayName: 'Ahmet Yılmaz',
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
      lastAnalysisAt: ts(new Date(now.getTime() - 2 * 24 * 60 * 60 * 1000)),
    },
    {
      id: 'patient_demo_002',
      displayName: 'Elif Demir',
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
      lastAnalysisAt: ts(new Date(now.getTime() - 5 * 24 * 60 * 60 * 1000)),
    },
    {
      id: 'patient_demo_003',
      displayName: 'Mehmet Kaya',
      avatarUrl: 'https://i.pravatar.cc/150?img=7',
      lastAnalysisAt: ts(new Date(now.getTime() - 12 * 60 * 60 * 1000)),
    },
    {
      id: 'patient_demo_004',
      displayName: 'Zeynep Çelik',
      avatarUrl: 'https://i.pravatar.cc/150?img=21',
      lastAnalysisAt: ts(new Date(now.getTime() - 9 * 24 * 60 * 60 * 1000)),
    },
    {
      id: 'patient_demo_005',
      displayName: 'Can Aydın',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      lastAnalysisAt: ts(new Date(now.getTime() - 3 * 60 * 60 * 1000)),
    },
  ];

  for (const p of patients) {
    const ref = db.collection('patients_public').doc(p.id);
    await ref.set({
      displayName: p.displayName,
      avatarUrl: p.avatarUrl,
      lastAnalysisAt: p.lastAnalysisAt,
    }, { merge: true });
    // eslint-disable-next-line no-console
    console.log(`✓ Upserted patients_public/${p.id}`);
  }
}

async function seedSampleChats() {
  const messages = [
    { text: 'Merhaba, nasılsınız?', sender: 'doctor', senderName: 'Doctor', isFromDoctor: true },
    { text: 'İyiyim, teşekkürler. Kontrolümü ne zaman yapmalıyım?', sender: 'patient', senderName: 'Hasta', isFromDoctor: false },
    { text: 'Yarın saat 10:30 uygun, teyit eder misiniz?', sender: 'doctor', senderName: 'Doctor', isFromDoctor: true },
  ];
  const patientIds = ['patient_demo_001', 'patient_demo_003'];
  for (const pid of patientIds) {
    for (const m of messages) {
      await db.collection('doctor_chats').doc(pid).collection('messages').add({
        text: m.text,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        sender: m.sender,
        senderName: m.senderName,
        isFromDoctor: m.isFromDoctor,
        type: 'text',
      });
    }
    // eslint-disable-next-line no-console
    console.log(`✓ Seeded chat messages for ${pid}`);
  }
}

async function run() {
  try {
    await seedPatients();
    await seedSampleChats();
    // eslint-disable-next-line no-console
    console.log('✅ Seeding completed.');
    process.exit(0);
  } catch (e) {
    // eslint-disable-next-line no-console
    console.error('Seeding failed:', e);
    process.exit(1);
  }
}

run();


