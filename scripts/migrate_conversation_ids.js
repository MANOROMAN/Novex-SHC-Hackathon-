/**
 * Migration script: Eski email-based conversation ID'lerini yeni doctor ID'lerine çevir
 * 
 * Kullanım:
 * node scripts/migrate_conversation_ids.js
 */

const admin = require('firebase-admin');

// Firebase Admin SDK'yı application default credentials ile initialize et
// veya GOOGLE_APPLICATION_CREDENTIALS environment variable kullan
try {
  admin.initializeApp({
    credential: admin.credential.applicationDefault()
  });
} catch (error) {
  console.log('⚠️  Application default credentials bulunamadı, project ID ile deneniyor...');
  admin.initializeApp({
    projectId: 'smile-hair-clinic-app',
  });
}

const db = admin.firestore();

// Email -> Doctor ID mapping
const emailToDoctorId = {
  'saricitarik@gmail.com': 'dr_tarik_sarici',
  'yusufgunel71@hotmail.com': 'dr_yusuf_gunel',
};

async function migrateConversations() {
  console.log('🔄 Conversation ID migration başlatılıyor...\n');
  
  try {
    // Tüm conversation'ları al
    const conversationsSnapshot = await db.collection('conversations').get();
    
    if (conversationsSnapshot.empty) {
      console.log('❌ Hiç conversation bulunamadı.');
      return;
    }
    
    console.log(`📊 Toplam ${conversationsSnapshot.size} conversation bulundu.\n`);
    
    let migratedCount = 0;
    let skippedCount = 0;
    
    for (const doc of conversationsSnapshot.docs) {
      const conversationId = doc.id;
      const data = doc.data();
      
      console.log(`🔍 İşleniyor: ${conversationId}`);
      
      // Eski format kontrolü: email_at_domain_com formatında mı?
      const oldDoctorIdMatch = conversationId.match(/^(.+)_at_(.+)_com_(.+)$/);
      
      if (!oldDoctorIdMatch) {
        console.log(`   ⏭️  Atlandı: Zaten yeni formatta\n`);
        skippedCount++;
        continue;
      }
      
      // Email'i yeniden oluştur
      const emailUser = oldDoctorIdMatch[1];
      const emailDomain = oldDoctorIdMatch[2].replace(/_/g, '.');
      const patientId = oldDoctorIdMatch[3];
      const oldDoctorEmail = `${emailUser}@${emailDomain}.com`;
      
      console.log(`   📧 Email: ${oldDoctorEmail}`);
      
      // Yeni doctor ID'yi bul
      const newDoctorId = emailToDoctorId[oldDoctorEmail];
      
      if (!newDoctorId) {
        console.log(`   ⚠️  Uyarı: Bu email için doctor ID mapping bulunamadı\n`);
        skippedCount++;
        continue;
      }
      
      // Yeni conversation ID
      const newConversationId = `${newDoctorId}_${patientId}`;
      
      console.log(`   🆕 Yeni ID: ${newConversationId}`);
      
      // Yeni conversation ID zaten var mı kontrol et
      const newConvDoc = await db.collection('conversations').doc(newConversationId).get();
      
      if (newConvDoc.exists) {
        console.log(`   ⚠️  Uyarı: Yeni ID zaten mevcut, birleştirme gerekli\n`);
        skippedCount++;
        continue;
      }
      
      // Batch işlemi başlat
      const batch = db.batch();
      
      // 1. Yeni conversation document'i oluştur
      const newConvRef = db.collection('conversations').doc(newConversationId);
      batch.set(newConvRef, {
        ...data,
        doctorId: newDoctorId,
        migrated: true,
        migratedFrom: conversationId,
        migratedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      
      // 2. Tüm mesajları kopyala
      const messagesSnapshot = await db
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .get();
      
      console.log(`   💬 ${messagesSnapshot.size} mesaj kopyalanacak`);
      
      for (const messageDoc of messagesSnapshot.docs) {
        const messageData = messageDoc.data();
        const newMessageRef = newConvRef.collection('messages').doc(messageDoc.id);
        batch.set(newMessageRef, messageData);
      }
      
      // 3. Batch'i commit et
      await batch.commit();
      
      console.log(`   ✅ Migration başarılı!`);
      
      // 4. Eski conversation'ı sil (opsiyonel - yorumdan çıkarabilirsiniz)
      // await db.collection('conversations').doc(conversationId).delete();
      // console.log(`   🗑️  Eski conversation silindi`);
      
      console.log('');
      migratedCount++;
    }
    
    console.log('\n✨ Migration tamamlandı!');
    console.log(`📊 Özet:`);
    console.log(`   - Migrate edilen: ${migratedCount}`);
    console.log(`   - Atlanan: ${skippedCount}`);
    console.log(`   - Toplam: ${conversationsSnapshot.size}`);
    
  } catch (error) {
    console.error('❌ Migration hatası:', error);
    throw error;
  }
}

// Script'i çalıştır
migrateConversations()
  .then(() => {
    console.log('\n✅ Script başarıyla tamamlandı');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Script hatası:', error);
    process.exit(1);
  });

