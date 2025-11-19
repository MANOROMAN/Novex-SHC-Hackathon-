const admin = require('firebase-admin');
const path = require('path');

// Change this path to your service account json if needed.
const serviceAccountPath = path.resolve(__dirname, '../serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(require(serviceAccountPath)),
});

const db = admin.firestore();

async function backfillParticipantsKey() {
  const conversationsRef = db.collection('conversations');
  let processed = 0;
  let updated = 0;

  console.log('Starting backfill for participantsKey...');

  const snapshot = await conversationsRef.get();
  console.log(`Total conversations found: ${snapshot.size}`);

  for (const doc of snapshot.docs) {
    processed += 1;
    const data = doc.data();
    const doctorId = data.doctorId;
    const patientId = data.patientId;
    const participantsKey = data.participantsKey;

    if (!doctorId || !patientId) {
      console.warn(`Skipping ${doc.id} (missing doctorId or patientId)`);
      continue;
    }

    const canonicalKey = [doctorId, patientId].sort().join('::');
    if (participantsKey === canonicalKey) {
      continue;
    }

    await doc.ref.set(
      {
        participantsKey: canonicalKey,
      },
      { merge: true },
    );
    updated += 1;
    if (updated % 100 === 0) {
      console.log(`Updated ${updated} conversations so far...`);
    }
  }

  console.log(`Backfill completed. Processed: ${processed}, Updated: ${updated}`);
}

backfillParticipantsKey()
  .then(() => {
    console.log('Done.');
    process.exit(0);
  })
  .catch((err) => {
    console.error('Backfill failed:', err);
    process.exit(1);
  });

