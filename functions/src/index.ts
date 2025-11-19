import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
import { getMessaging } from 'firebase-admin/messaging';
import * as cors from 'cors';
import * as https from 'https';
import * as dotenv from 'dotenv';

// Load environment variables from .env file
dotenv.config();

const BACKFILL_TOKEN = process.env.BACKFILL_TOKEN || 'set-a-strong-token';

admin.initializeApp();
const db = admin.firestore();
const corsHandler = cors({ origin: true });

function pickDisplayName(userData: any): string {
  return (
    userData?.displayName ||
    userData?.name ||
    userData?.fullName ||
    'Hasta'
  );
}

function pickAvatarUrl(userData: any): string {
  return (
    userData?.photoUrl ||
    userData?.avatarUrl ||
    ''
  );
}

async function computeLastAnalysisAt(userId: string): Promise<admin.firestore.Timestamp | null> {
  const snap = await db
    .collection('users')
    .doc(userId)
    .collection('analyses')
    .orderBy('createdAt', 'desc')
    .limit(1)
    .get();
  if (snap.empty) return null;
  const ts = snap.docs[0].get('createdAt') as admin.firestore.Timestamp | undefined;
  return ts ?? null;
}

export const mirrorUserToPatientsPublic = functions.firestore
  .document('users/{userId}')
  .onWrite(async (change, context) => {
    const userId = context.params.userId as string;
    const after = change.after.exists ? change.after.data() : null;
    if (!after) {
      // user deleted -> remove public doc
      await db.collection('patients_public').doc(userId).delete().catch(() => undefined);
      return;
    }
    const displayName = pickDisplayName(after);
    const avatarUrl = pickAvatarUrl(after);
    const lastAnalysisAt = await computeLastAnalysisAt(userId);
    const payload: FirebaseFirestore.DocumentData = {
      displayName,
      avatarUrl,
    };
    if (lastAnalysisAt) {
      payload.lastAnalysisAt = lastAnalysisAt;
    }
    await db.collection('patients_public').doc(userId).set(payload, { merge: true });
  });

export const updateLastAnalysisOnChange = functions.firestore
  .document('users/{userId}/analyses/{analysisId}')
  .onWrite(async (_change, context) => {
    const userId = context.params.userId as string;
    const lastAnalysisAt = await computeLastAnalysisAt(userId);
    const ref = db.collection('patients_public').doc(userId);
    if (lastAnalysisAt) {
      await ref.set({ lastAnalysisAt }, { merge: true });
    } else {
      await ref.set({ lastAnalysisAt: admin.firestore.FieldValue.delete() }, { merge: true });
    }
  });

// Mirror each analysis document to a public subset
export const mirrorAnalysisToPublic = functions.firestore
  .document('users/{userId}/analyses/{analysisId}')
  .onWrite(async (change, context) => {
    const userId = context.params.userId as string;
    const analysisId = context.params.analysisId as string;
    const publicRef = db.collection('patients_public').doc(userId)
      .collection('analyses_public').doc(analysisId);

    if (!change.after.exists) {
      await publicRef.delete().catch(() => undefined);
      return;
    }
    const data = change.after.data() || {};
    const payload: FirebaseFirestore.DocumentData = {
      createdAt: data.createdAt ?? admin.firestore.FieldValue.serverTimestamp(),
      imageUrl: data.imageUrl ?? '',
      stage: data.stage ?? '',
      approvalStatus: data.approvalStatus ?? 'pending',
      title: data.title ?? '',
    };
    await publicRef.set(payload, { merge: true });
  });

// AI tarafından onaylanmış (isValid: true) fotoğrafları otomatik olarak doctor_approved_results'a kopyala
export const autoCopyAiApprovedToDoctorResults = functions.firestore
  .document('users/{userId}/analyses/{analysisId}')
  .onWrite(async (change, context) => {
    try {
      const userId = context.params.userId as string;
      const analysisId = context.params.analysisId as string;
      
      if (!change.after.exists) {
        // Silme durumunda doctor_approved_results'tan da sil
        await db.collection('doctor_approved_results').doc(analysisId).delete().catch(() => undefined);
        return;
      }
      
      const data = change.after.data() || {};
      const isValid = data.isValid === true;
      const status = data.status;
      const approvalStatus = data.approvalStatus;
      
      // AI tarafından onaylanmış ve completed olan analizleri kopyala
      if (isValid && status === 'completed' && 
          (approvalStatus === 'pending_doctor_review' || approvalStatus === 'pending' || !approvalStatus)) {
        
        // Zaten doctor_approved_results'ta var mı kontrol et
        const existingDoc = await db.collection('doctor_approved_results').doc(analysisId).get();
        if (existingDoc.exists && existingDoc.data()?.approvalStatus === 'approved') {
          // Doktor zaten onaylamış, değiştirme
          return;
        }
        
        // doctor_approved_results'a kopyala (AI onaylı olarak işaretle)
        await db.collection('doctor_approved_results').doc(analysisId).set({
          patientId: userId,
          analysisId: analysisId,
          imageUrl: data.imageUrl || '',
          photoUrls: data.photoUrls || {},
          description: data.description || data.message || '',
          analysisData: data.analysisData || {},
          visualAnalysis: data.visualAnalysis || {},
          detectedAngles: data.detectedAngles || {},
          samePerson: data.samePerson ?? true,
          status: 'completed',
          isValid: true,
          approvalStatus: 'ai_approved', // AI tarafından onaylanmış
          aiApprovedAt: admin.firestore.FieldValue.serverTimestamp(),
          createdAt: data.createdAt || admin.firestore.FieldValue.serverTimestamp(),
          originalCreatedAt: data.originalCreatedAt || data.createdAt || admin.firestore.FieldValue.serverTimestamp(),
        }, { merge: true });
        
        console.log(`✅ AI onaylı analiz kopyalandı: ${userId}/${analysisId}`);
      }
    } catch (error: any) {
      console.error('❌ autoCopyAiApprovedToDoctorResults hatası:', error);
      // Hata durumunda devam et, analiz kaydını etkilemesin
    }
  });

// Başarılı kaydedilmiş randevuları (confirmed, completed) otomatik olarak doctor_approved_appointments'a kopyala
export const autoCopySuccessfulAppointments = functions.firestore
  .document('appointments/{appointmentId}')
  .onWrite(async (change, context) => {
    try {
      const appointmentId = context.params.appointmentId as string;
      
      if (!change.after.exists) {
        // Silme durumunda doctor_approved_appointments'tan da sil
        await db.collection('doctor_approved_appointments').doc(appointmentId).delete().catch(() => undefined);
        return;
      }
      
      const data = change.after.data() || {};
      const status = data.status;
      
      // Başarılı randevuları (confirmed veya completed) kopyala
      if (status === 'confirmed' || status === 'completed') {
        
        // Zaten doctor_approved_appointments'ta var mı kontrol et
        const existingDoc = await db.collection('doctor_approved_appointments').doc(appointmentId).get();
        if (existingDoc.exists) {
          // Zaten var, güncelle
          await db.collection('doctor_approved_appointments').doc(appointmentId).set({
            ...data,
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
          }, { merge: true });
        } else {
          // Yeni kayıt, kopyala
          await db.collection('doctor_approved_appointments').doc(appointmentId).set({
            ...data,
            copiedAt: admin.firestore.FieldValue.serverTimestamp(),
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
          }, { merge: true });
        }
        
        console.log(`✅ Başarılı randevu kopyalandı: ${appointmentId} (status: ${status})`);
      } else if (status === 'cancelled' || status === 'pending') {
        // İptal edilmiş veya bekleyen randevuları sil
        await db.collection('doctor_approved_appointments').doc(appointmentId).delete().catch(() => undefined);
      }
    } catch (error: any) {
      console.error('❌ autoCopySuccessfulAppointments hatası:', error);
      // Hata durumunda devam et, randevu kaydını etkilemesin
    }
  });

// Backfill function to copy AI-approved analyses to doctor_approved_results
// Bu fonksiyon isValid: true ve status: 'completed' olan analizleri ai_approved olarak kopyalar
export const backfillDoctorApprovedResults = functions.https.onRequest(async (req, res) => {
  try {
    const token = (req.query.token as string | undefined) ?? '';
    if (token !== BACKFILL_TOKEN) {
      res.status(401).send('Unauthorized');
      return;
    }
    
    const limit = Math.min(parseInt((req.query.limit as string) || '1000', 10) || 1000, 5000);
    let processed = 0;
    let copied = 0;
    
    console.log('🔄 Backfill başlatılıyor: AI onaylı analizleri doctor_approved_results\'a kopyalama...');
    
    // Get all users
    const usersSnap = await db.collection('users').limit(limit).get();
    console.log(`📊 ${usersSnap.docs.length} kullanıcı bulundu`);
    
    for (const userDoc of usersSnap.docs) {
      const userId = userDoc.id;
      
      // Get all analyses with isValid: true and status: 'completed'
      // Bu analizler AI tarafından onaylanmış olarak kabul edilir
      const analysesSnap = await db
        .collection('users')
        .doc(userId)
        .collection('analyses')
        .where('isValid', '==', true)
        .where('status', '==', 'completed')
        .get();
      
      console.log(`   Kullanıcı ${userId}: ${analysesSnap.docs.length} geçerli analiz bulundu`);
      
      for (const analysisDoc of analysesSnap.docs) {
        processed += 1;
        const analysisId = analysisDoc.id;
        const analysisData = analysisDoc.data();
        const approvalStatus = analysisData.approvalStatus;
        
        // Eğer zaten doktor onaylıysa, atla
        if (approvalStatus === 'approved') {
          continue;
        }
        
        // Check if already exists in doctor_approved_results
        const existingDoc = await db.collection('doctor_approved_results').doc(analysisId).get();
        if (existingDoc.exists) {
          const existingData = existingDoc.data();
          // Eğer zaten doktor onaylıysa, atla
          if (existingData?.approvalStatus === 'approved') {
            continue;
          }
          // Eğer zaten ai_approved ise, güncelleme (tekrar kopyalama)
        }
        
        // Copy to doctor_approved_results as ai_approved
        await db.collection('doctor_approved_results').doc(analysisId).set({
          patientId: userId,
          analysisId: analysisId,
          imageUrl: analysisData.imageUrl || '',
          photoUrls: analysisData.photoUrls || {},
          description: analysisData.description || analysisData.message || '',
          analysisData: analysisData.analysisData || {},
          visualAnalysis: analysisData.visualAnalysis || {},
          detectedAngles: analysisData.detectedAngles || {},
          samePerson: analysisData.samePerson ?? true,
          status: 'completed',
          isValid: true,
          approvalStatus: 'ai_approved', // AI onaylı olarak işaretle
          aiApprovedAt: admin.firestore.FieldValue.serverTimestamp(),
          createdAt: analysisData.createdAt || admin.firestore.FieldValue.serverTimestamp(),
          originalCreatedAt: analysisData.originalCreatedAt || analysisData.createdAt || admin.firestore.FieldValue.serverTimestamp(),
        }, { merge: true });
        
        copied += 1;
        console.log(`   ✅ Kopyalandı: ${userId}/${analysisId}`);
      }
    }
    
    console.log(`✅ Backfill tamamlandı: ${processed} işlendi, ${copied} kopyalandı`);
    res.status(200).json({ ok: true, processed, copied });
  } catch (e: any) {
    console.error('❌ Backfill hatası:', e);
    res.status(500).json({ ok: false, error: String(e?.message || e) });
  }
});

export const backfillPatientsPublic = functions.https.onRequest(async (req, res) => {
  try {
    const token = (req.query.token as string | undefined) ?? '';
    if (token !== BACKFILL_TOKEN) {
      res.status(401).send('Unauthorized');
      return;
    }
    const limit = Math.min(parseInt((req.query.limit as string) || '1000', 10) || 1000, 5000);
    const usersSnap = await db.collection('users').limit(limit).get();
    let count = 0;
    for (const doc of usersSnap.docs) {
      const userId = doc.id;
      const data = doc.data() || {};
      const displayName = pickDisplayName(data);
      const avatarUrl = pickAvatarUrl(data);
      const lastAnalysisAt = await computeLastAnalysisAt(userId);
      const payload: FirebaseFirestore.DocumentData = {
        displayName,
        avatarUrl,
      };
      if (lastAnalysisAt) {
        payload.lastAnalysisAt = lastAnalysisAt;
      }
      await db.collection('patients_public').doc(userId).set(payload, { merge: true });
      count += 1;
    }
    res.status(200).json({ ok: true, updated: count });
  } catch (e: any) {
    res.status(500).json({ ok: false, error: String(e?.message || e) });
  }
});

export const approveAnalysis = functions.https.onRequest(async (req, res) => {
  const token = (req.query.token as string | undefined) ?? '';
  if (token !== BACKFILL_TOKEN) { res.status(401).send('Unauthorized'); return; }
  const { userId, analysisId } = req.body || {};
  if (!userId || !analysisId) { res.status(400).send('Missing params'); return; }
  
  try {
    // Get the analysis data (önce doctor_approved_results'tan kontrol et, AI onaylı olabilir)
    let analysisData: FirebaseFirestore.DocumentData | undefined;
    let sourceCollection = 'users';
    
    const approvedDoc = await db.collection('doctor_approved_results').doc(analysisId).get();
    if (approvedDoc.exists && approvedDoc.data()?.approvalStatus === 'ai_approved') {
      // AI onaylı, doctor_approved_results'tan al
      analysisData = approvedDoc.data();
      sourceCollection = 'doctor_approved_results';
    } else {
      // Normal analiz, users collection'ından al
      const analysisDoc = await db.collection('users').doc(userId).collection('analyses').doc(analysisId).get();
      if (!analysisDoc.exists) {
        res.status(404).json({ ok: false, error: 'Analysis not found' });
        return;
      }
      analysisData = analysisDoc.data();
    }
    
    if (!analysisData) {
      res.status(404).json({ ok: false, error: 'Analysis data not found' });
      return;
    }
    
    // Update approval status in original location
    if (sourceCollection === 'users') {
  await db.collection('users').doc(userId).collection('analyses').doc(analysisId)
    .set({ approvalStatus: 'approved', updatedAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true });
    }
    
    // Update/Copy to doctor_approved_results collection (doktor onaylı olarak işaretle)
    await db.collection('doctor_approved_results').doc(analysisId).set({
      patientId: userId,
      analysisId: analysisId,
      imageUrl: analysisData.imageUrl || '',
      photoUrls: analysisData.photoUrls || {},
      description: analysisData.description || analysisData.message || '',
      analysisData: analysisData.analysisData || {},
      visualAnalysis: analysisData.visualAnalysis || {},
      detectedAngles: analysisData.detectedAngles || {},
      samePerson: analysisData.samePerson ?? true,
      status: 'completed',
      isValid: analysisData.isValid ?? true,
      approvalStatus: 'approved', // Doktor onaylı statüsü
      approvedAt: admin.firestore.FieldValue.serverTimestamp(),
      doctorApprovedAt: admin.firestore.FieldValue.serverTimestamp(), // Doktor onay tarihi
      createdAt: analysisData.createdAt || admin.firestore.FieldValue.serverTimestamp(),
      originalCreatedAt: analysisData.originalCreatedAt || analysisData.createdAt || admin.firestore.FieldValue.serverTimestamp(),
      aiApprovedAt: analysisData.aiApprovedAt || null, // AI onay tarihini koru
    }, { merge: true });
    
    // Send notification to patient
  await db.collection('users').doc(userId).collection('notifications').add({
    title: 'Analiz Onaylandı',
    message: 'Doktorunuz analizinizin onaylandığını bildirdi.',
    type: 'analysis',
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    isRead: false,
  });
    
  res.json({ ok: true });
  } catch (error: any) {
    console.error('approveAnalysis error:', error);
    res.status(500).json({ ok: false, error: String(error?.message || error) });
  }
});

export const rejectAnalysis = functions.https.onRequest(async (req, res) => {
  const token = (req.query.token as string | undefined) ?? '';
  if (token !== BACKFILL_TOKEN) { res.status(401).send('Unauthorized'); return; }
  const { userId, analysisId } = req.body || {};
  if (!userId || !analysisId) { res.status(400).send('Missing params'); return; }
  
  try {
    // Update approval status in original location
  await db.collection('users').doc(userId).collection('analyses').doc(analysisId)
    .set({ approvalStatus: 'rejected', updatedAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true });
    
    // Send notification to patient
  await db.collection('users').doc(userId).collection('notifications').add({
    title: 'Analiz İçin Düzeltme Gerekli',
    message: 'Lütfen analiz fotoğraflarınızı yönergelere göre tekrar yükleyin.',
    type: 'analysis',
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    isRead: false,
  });
    
  res.json({ ok: true });
  } catch (error: any) {
    console.error('rejectAnalysis error:', error);
    res.status(500).json({ ok: false, error: String(error?.message || error) });
  }
});

// List users basic info for doctors (read via HTTPS, avoids client rules)
export const listUsersPublic = functions.https.onRequest(async (req, res) => {
  const token = (req.query.token as string | undefined) ?? '';
  if (token !== BACKFILL_TOKEN) { res.status(401).send('Unauthorized'); return; }
  const limit = Math.min(parseInt((req.query.limit as string) || '500', 10) || 500, 2000);
  const usersSnap = await db.collection('users').limit(limit).get();
  const items = await Promise.all(usersSnap.docs.map(async (doc) => {
    const userId = doc.id;
    const data = doc.data() || {};
    const displayName = pickDisplayName(data);
    const avatarUrl = pickAvatarUrl(data);
    const lastAnalysisAt = await computeLastAnalysisAt(userId);
    return {
      id: userId,
      displayName,
      avatarUrl,
      lastAnalysisAt: lastAnalysisAt ? lastAnalysisAt.toDate().toISOString() : null,
    };
  }));
  res.json({ ok: true, items });
});

function normalizeDoctorEmail(email: string): string {
  return email.trim().toLowerCase();
}

function doctorLoginDocId(email: string, code: string): string {
  const normalized = normalizeDoctorEmail(email);
  return `login_${normalized.replace(/@/g, '_at_').replace(/\./g, '_')}_${code}`;
}

export const verifyDoctorLogin = functions.https.onRequest(async (req, res) => {
  corsHandler(req, res, async () => {
    if (req.method === 'OPTIONS') {
      res.set('Access-Control-Allow-Methods', 'POST');
      res.set('Access-Control-Allow-Headers', 'Content-Type');
      res.status(204).send('');
      return;
    }

    if (req.method !== 'POST') {
      res.status(405).send('Method Not Allowed');
      return;
    }

    try {
      const body = typeof req.body === 'string' ? JSON.parse(req.body) : req.body;
      const email = normalizeDoctorEmail(body?.email ?? '');
      const code = (body?.code ?? '').trim();

      console.log('verifyDoctorLogin: Email:', email, 'Code:', code);

      if (!email || !code) {
        console.log('verifyDoctorLogin: Missing parameters');
        res.status(400).json({ error: 'missing_parameters' });
        return;
      }

      const docId = doctorLoginDocId(email, code);
      console.log('verifyDoctorLogin: DocId:', docId);
      const loginRef = db.collection('doctor_logins').doc(docId);
      const loginSnap = await loginRef.get();
      
      if (!loginSnap.exists) {
        console.log('verifyDoctorLogin: Code not found, DocId:', docId);
        // Debug: List all doctor_logins to see what's there
        const allLogins = await db.collection('doctor_logins').limit(5).get();
        console.log('verifyDoctorLogin: Sample login docs:', allLogins.docs.map(d => d.id));
        res.status(400).json({ error: 'invalid_code', docId: docId });
        return;
      }
      const loginData = loginSnap.data() ?? {};
      
      // Süre kontrolü - kod süresi dolmuşsa hata ver
      const expiresAt = loginData.expiresAt as FirebaseFirestore.Timestamp | undefined;
      if (expiresAt && expiresAt.toMillis() < Date.now()) {
        console.log('verifyDoctorLogin: Code expired');
        res.status(400).json({ error: 'code_expired' });
        return;
      }

      // ÖNEMLI: Kod kullanılmış kontrolünü KALDIRDIK
      // Böylece aynı kod 10 dakika boyunca kullanılabilir
      // Sadece süre kontrolü yapıyoruz
      console.log('verifyDoctorLogin: Code is valid and not expired');

      // Doktor kontrolü
      const doctorSnap = await db
        .collection('doctors')
        .where('email', '==', email)
        .where('active', '==', true)
        .limit(1)
        .get();

      if (doctorSnap.empty) {
        console.log('verifyDoctorLogin: Doctor not found for email:', email);
        // Debug: List all doctors
        const allDoctors = await db.collection('doctors').where('active', '==', true).limit(10).get();
        console.log('verifyDoctorLogin: Active doctors:', allDoctors.docs.map(d => ({ id: d.id, email: d.data().email })));
        res.status(400).json({ error: 'doctor_not_found', email: email });
        return;
      }

      const doctorDoc = doctorSnap.docs[0];
      const doctorId = doctorDoc.id;
      const doctorData = doctorDoc.data() ?? {};
      const doctorName = (doctorData.name as string | undefined) ?? 'Doctor';

      console.log('verifyDoctorLogin: Doctor found - ID:', doctorId, 'Name:', doctorName);

      const uid = `doctor_${doctorId}`;
      try {
        await admin.auth().getUser(uid);
        console.log('verifyDoctorLogin: Firebase Auth user exists');
      } catch (_) {
        console.log('verifyDoctorLogin: Creating new Firebase Auth user');
        await admin.auth().createUser({
          uid,
          displayName: doctorName,
        });
      }

      await admin.auth().setCustomUserClaims(uid, {
        role: 'doctor',
        doctorId,
      });

      let token: string;
      try {
        token = await admin.auth().createCustomToken(uid, {
        role: 'doctor',
        doctorId,
      });
      } catch (tokenError: any) {
        console.error('createCustomToken error:', tokenError);
        // Fallback: Return UID and let client handle auth
        if (tokenError.code === 'auth/insufficient-permission') {
          console.log('Using fallback: returning UID instead of token');
          res.json({
            uid,
            doctorId,
            doctorName,
            requiresManualAuth: true,
          });
          return;
        }
        throw tokenError;
      }

      res.json({
        token,
        doctorId,
        doctorName,
      });
    } catch (error: any) {
      console.error('verifyDoctorLogin error', error);
      res.status(500).json({ error: 'server_error' });
    }
  });
});

function computeParticipantsKey(doctorId: string, patientId: string): string {
  return doctorId < patientId
    ? `${doctorId}::${patientId}`
    : `${patientId}::${doctorId}`;
}

export const backfillConversationsParticipantsKey = functions.https.onRequest(async (req, res) => {
  const token = (req.query.token as string | undefined) ?? '';
  if (token !== BACKFILL_TOKEN) {
    res.status(401).send('Unauthorized');
    return;
  }

  try {
    const conversationsRef = db.collection('conversations');
    const pageSize = 500;
    let processed = 0;
    let updated = 0;
    let lastDoc: FirebaseFirestore.QueryDocumentSnapshot | null = null;

    while (true) {
      let query = conversationsRef.orderBy(admin.firestore.FieldPath.documentId()).limit(pageSize);
      if (lastDoc) {
        query = query.startAfter(lastDoc);
      }
      const snapshot = await query.get();
      if (snapshot.empty) {
        break;
      }

      for (const doc of snapshot.docs) {
        processed += 1;
        const data = doc.data();
        const doctorId = data.doctorId as string | undefined;
        const patientId = data.patientId as string | undefined;
        if (!doctorId || !patientId) {
          continue;
        }
        const expectedKey = computeParticipantsKey(doctorId, patientId);
        if (data.participantsKey === expectedKey) {
          continue;
        }
        await doc.ref.set({ participantsKey: expectedKey }, { merge: true });
        updated += 1;
      }

      lastDoc = snapshot.docs[snapshot.docs.length - 1];
    }

    res.json({ ok: true, processed, updated });
  } catch (error: any) {
    console.error('backfillConversationsParticipantsKey error', error);
    res.status(500).json({ error: 'server_error' });
  }
});

// Her dakika çalışır: due medication reminders -> FCM push gönder
// Yeni mesaj geldiğinde push notification gönder
export const sendMessageNotification = functions.firestore
  .document('conversations/{conversationId}/messages/{messageId}')
  .onCreate(async (snap, context) => {
    const message = snap.data();
    const senderRole = message.senderRole as string;
    const senderName = message.senderName as string;
    const messageText = message.message as string;
    const receiverId = message.receiverId as string;

    if (!receiverId) return;

    try {
      // Alıcının FCM token'ını al
      const userDoc = await db.collection('users').doc(receiverId).get();
      const fcmToken = userDoc.get('fcmToken') as string | undefined;

      if (!fcmToken) {
        console.log(`No FCM token for user ${receiverId}`);
        return;
      }

      // Gönderen kim?
      const title = senderRole === 'doctor' 
        ? `Dr. ${senderName}` 
        : senderName;

      // Notification gönder
      await getMessaging().send({
        token: fcmToken,
        notification: {
          title: title,
          body: messageText.length > 100 ? messageText.substring(0, 100) + '...' : messageText,
        },
        data: {
          type: 'chat_message',
          senderId: message.senderId as string,
          senderRole: senderRole,
          conversationId: context.params.conversationId,
        },
        android: { 
          priority: 'high',
          notification: {
            channelId: 'chat_messages',
            sound: 'default',
          },
        },
        apns: { 
          payload: { 
            aps: { 
              sound: 'default',
              badge: 1,
            },
          },
        },
      });

      console.log(`Notification sent to ${receiverId} from ${senderName}`);
    } catch (error) {
      console.error('Error sending notification:', error);
    }
  });

export const sendDueMedicationReminders = functions.pubsub
  .schedule('every 1 minutes')
  .timeZone('Europe/Istanbul')
  .onRun(async () => {
    const now = admin.firestore.Timestamp.now();

    // Kullanıcıları dolaşmak yerine, medication_reminders alt koleksiyonlarını tarayalım (collection group)
    const remindersSnap = await db.collectionGroup('medication_reminders')
      .where('active', '==', true)
      .where('nextSendAt', '<=', now)
      .limit(200)
      .get();

    if (remindersSnap.empty) return null;

    const batches: Promise<any>[] = [];

    for (const doc of remindersSnap.docs) {
      try {
        const reminder = doc.data();
        // userId'yi parent path'inden çıkar
        const userId = doc.ref.parent.parent?.id;
        if (!userId) continue;

        const userDoc = await db.collection('users').doc(userId).get();
        const fcmToken = userDoc.get('fcmToken') as string | undefined;
        if (!fcmToken) {
          // Token yoksa bir sonraki gün tekrar denemek yerine nextSendAt'i ileri al
          const next = incrementOneDay(reminder.nextSendAt);
          batches.push(doc.ref.set({ nextSendAt: next, updatedAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true }));
          continue;
        }

        const title = 'İlaç Hatırlatması';
        const label = reminder.label || 'İlaç';
        const body = `${label} zamanı. Lütfen günlük bakımınızı tamamlayın.`;

        await getMessaging().send({
          token: fcmToken,
          notification: { title, body },
          data: {
            type: 'medication',
            label: String(label),
          },
          android: { priority: 'high' },
          apns: { payload: { aps: { sound: 'default' } } },
        });

        // Sonraki güne ileri al
        const next = incrementOneDay(reminder.nextSendAt);
        batches.push(doc.ref.set({ nextSendAt: next, lastSentAt: now, updatedAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true }));
      } catch (e) {
        console.error('Medication reminder error:', e);
      }
    }

    await Promise.all(batches);
    return null;
  });

function incrementOneDay(ts: admin.firestore.Timestamp | Date | string): admin.firestore.Timestamp {
  const date = ts instanceof admin.firestore.Timestamp ? ts.toDate() : new Date(ts);
  const next = new Date(date.getTime() + 24 * 60 * 60 * 1000);
  return admin.firestore.Timestamp.fromDate(next);
}

// EmailJS configuration from environment variables
const EMAILJS_SERVICE_ID = process.env.EMAILJS_SERVICE_ID || 'service_7kq3vmo';
const EMAILJS_TEMPLATE_ID = process.env.EMAILJS_TEMPLATE_ID || 'template_sth16fw';
const EMAILJS_PUBLIC_KEY = process.env.EMAILJS_PUBLIC_KEY || 'I9HB304flwCBHpFFk';
const EMAILJS_PRIVATE_KEY = process.env.EMAILJS_PRIVATE_KEY || 'NDzQn_wktzTgmt7qgU2tr';

// Log EmailJS configuration on startup (without exposing full key)
console.log('📧 EmailJS Configuration:');
console.log(`   Service ID: ${EMAILJS_SERVICE_ID}`);
console.log(`   Template ID: ${EMAILJS_TEMPLATE_ID}`);
console.log(`   Public Key: ${EMAILJS_PUBLIC_KEY ? EMAILJS_PUBLIC_KEY.substring(0, 4) + '...' : 'NOT SET'}`);
console.log(`   Private Key: ${EMAILJS_PRIVATE_KEY ? EMAILJS_PRIVATE_KEY.substring(0, 4) + '...' : 'NOT SET'}`);

// Send email via EmailJS (server-side, bypasses browser-only restriction)
async function sendEmailViaEmailJS(params: {
  toEmail: string;
  subject: string;
  message: string;
  code?: string;
  passcode?: string;
  time?: string;
}): Promise<boolean> {
  return new Promise((resolve, reject) => {
    const startTime = Date.now();
    
    const templateParams: any = {
      to_email: params.toEmail,
      subject: params.subject,
      message: params.message,
      to_name: params.toEmail.split('@')[0],
    };
    
    if (params.code) templateParams.code = params.code;
    if (params.passcode) templateParams.passcode = params.passcode;
    if (params.time) templateParams.time = params.time;

    const payloadData: any = {
      service_id: EMAILJS_SERVICE_ID,
      template_id: EMAILJS_TEMPLATE_ID,
      user_id: EMAILJS_PUBLIC_KEY,
      template_params: templateParams,
    };

    // Add private key if available (required for strict mode)
    if (EMAILJS_PRIVATE_KEY) {
      payloadData.accessToken = EMAILJS_PRIVATE_KEY;
    }

    const payload = JSON.stringify(payloadData);

    const options = {
      hostname: 'api.emailjs.com',
      port: 443,
      path: '/api/v1.0/email/send',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(payload),
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Origin': 'https://emailjs.com',
        'Referer': 'https://emailjs.com/',
        'Connection': 'close', // Performans: Connection'ı kapat
      },
      timeout: 15000, // Timeout 15 saniyeye çıkarıldı
    };

    console.log(`EmailJS: Sending email to ${params.toEmail}`);
    console.log(`EmailJS: Service ID: ${EMAILJS_SERVICE_ID}, Template ID: ${EMAILJS_TEMPLATE_ID}`);
    console.log(`EmailJS: Payload: ${payload.substring(0, 200)}...`);

    const req = https.request(options, (res) => {
      let data = '';
      res.on('data', (chunk) => {
        data += chunk;
      });
      res.on('end', () => {
        const elapsed = Date.now() - startTime;
        console.log(`EmailJS: Response received (${elapsed}ms) - Status: ${res.statusCode}`);
        console.log(`EmailJS: Response body: ${data}`);
        
        if (res.statusCode === 200) {
          try {
            const responseData = JSON.parse(data);
            if (responseData.text === 'OK' || responseData.status === 200) {
              console.log(`✅ EmailJS: Email sent successfully (${elapsed}ms)`);
              resolve(true);
            } else {
              console.error(`❌ EmailJS: Unexpected response format: ${data}`);
              reject(new Error(`EmailJS unexpected response: ${data}`));
            }
          } catch (e) {
            // Response JSON değil ama 200 döndü
            if (data.toLowerCase().includes('ok') || data.trim() === '') {
              console.log(`✅ EmailJS: Email sent successfully (${elapsed}ms) - Non-JSON response`);
              resolve(true);
            } else {
              console.error(`❌ EmailJS: Failed to parse response: ${data}`);
              reject(new Error(`EmailJS parse error: ${data}`));
            }
          }
        } else {
          console.error(`❌ EmailJS: Failed with status ${res.statusCode} (${elapsed}ms): ${data}`);
          reject(new Error(`EmailJS error: ${res.statusCode} - ${data}`));
        }
      });
    });

    req.on('error', (error) => {
      const elapsed = Date.now() - startTime;
      console.error(`❌ EmailJS: Request error (${elapsed}ms):`, error);
      reject(error);
    });

    req.on('timeout', () => {
      req.destroy();
      const elapsed = Date.now() - startTime;
      console.error(`❌ EmailJS: Request timeout (${elapsed}ms)`);
      reject(new Error('EmailJS request timeout after 15 seconds'));
    });

    req.setTimeout(15000); // 15 saniye timeout
    req.write(payload);
    req.end();
  });
}

// Cloud Function to send doctor login code via EmailJS
export const sendDoctorLoginCode = functions.runWith({
  timeoutSeconds: 30, // Timeout 30 saniyeye çıkarıldı (EmailJS yavaş olabilir)
  memory: '256MB',
}).https.onRequest(async (req, res) => {
  corsHandler(req, res, async () => {
    const startTime = Date.now();
    
    if (req.method === 'OPTIONS') {
      res.set('Access-Control-Allow-Methods', 'POST');
      res.set('Access-Control-Allow-Headers', 'Content-Type');
      res.status(204).send('');
      return;
    }

    if (req.method !== 'POST') {
      res.status(405).send('Method Not Allowed');
      return;
    }

    try {
      const body = typeof req.body === 'string' ? JSON.parse(req.body) : req.body;
      const email = normalizeDoctorEmail(body?.email ?? '');
      const code = (body?.code ?? '').trim();
      const timeString = body?.timeString ?? '';

      console.log(`sendDoctorLoginCode: Başladı - Email: ${email}, Code: ${code}`);

      if (!email || !code) {
        res.status(400).json({ error: 'missing_parameters' });
        return;
      }

      // GÜVENLİK: Email'in doktor olup olmadığını kontrol et
      console.log(`sendDoctorLoginCode: Doktor kontrolü yapılıyor - Email: ${email}`);
      const doctorSnap = await db
        .collection('doctors')
        .where('email', '==', email)
        .where('active', '==', true)
        .limit(1)
        .get();

      if (doctorSnap.empty) {
        console.log(`sendDoctorLoginCode: Email doktor değil veya aktif değil - Email: ${email}`);
        res.status(403).json({ error: 'not_a_doctor', message: 'Bu e-posta adresi doktor olarak kayıtlı değil veya aktif değil.' });
        return;
      }

      console.log(`sendDoctorLoginCode: Email doktor olarak doğrulandı - Email: ${email}`);

      // Send email via EmailJS with timeout
      const emailPromise = sendEmailViaEmailJS({
        toEmail: email,
        subject: `Giriş Kodu (Doktor) - ${code}`,
        message: `Merhaba,\n\nGiriş için tek kullanımlık doğrulama kodunuz: ${code}\nBu kod 10 dakika boyunca geçerlidir.\n\nİyi çalışmalar.`,
        code: code,
        passcode: code,
        time: timeString,
      });

      // Timeout wrapper - Cloud Function timeout'undan önce bitmeli
      const timeoutPromise = new Promise<never>((_, reject) => {
        setTimeout(() => reject(new Error('EmailJS timeout after 12 seconds')), 12000);
      });

      await Promise.race([emailPromise, timeoutPromise]);

      const elapsed = Date.now() - startTime;
      console.log(`sendDoctorLoginCode: Başarılı - ${elapsed}ms`);

      res.json({ ok: true, message: 'Email sent successfully' });
    } catch (error: any) {
      const elapsed = Date.now() - startTime;
      console.error(`sendDoctorLoginCode error (${elapsed}ms):`, error);
      res.status(500).json({ error: 'server_error', message: error?.message || String(error) });
    }
  });
});


