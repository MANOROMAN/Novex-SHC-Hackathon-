import 'package:flutter/material.dart';
import '../utils/firebase_seed_data.dart';

class SeedDoctorsScreen extends StatefulWidget {
  const SeedDoctorsScreen({super.key});

  @override
  State<SeedDoctorsScreen> createState() => _SeedDoctorsScreenState();
}

class _SeedDoctorsScreenState extends State<SeedDoctorsScreen> {
  String _status = 'Seeding starting...';

  @override
  void initState() {
    super.initState();
    _runSeeding();
  }

  Future<void> _runSeeding() async {
    try {
      setState(() {
        _status = 'Checking and creating doctors...';
      });
      final seeder = FirebaseSeedData();
      // Ensure requested doctor without reads
      const targetEmail = 'saricitarik@gmail.com';
      const targetName = 'Tarık Sarıcı';
      final targetDocId = targetEmail.replaceAll('@', '_at_').replaceAll('.', '_');
      await seeder.createDoctorByIdIfMissing(
        docId: targetDocId,
        email: targetEmail,
        name: targetName,
      );
      // Ensure Yusuf Günel doctor
      const yusufEmail = 'yusufgunel71@hotmail.com';
      const yusufName = 'Dr. Yusuf Günel';
      final yusufDocId = yusufEmail.replaceAll('@', '_at_').replaceAll('.', '_');
      await seeder.createDoctorByIdIfMissing(
        docId: yusufDocId,
        email: yusufEmail,
        name: yusufName,
      );
      // Ensure Dr. Erhan Atalar
      const atalarEmail = 'atalare@itu.edu.tr';
      const atalarName = 'Dr. Erhan Atalar';
      final atalarDocId = atalarEmail.replaceAll('@', '_at_').replaceAll('.', '_');
      await seeder.createDoctorByIdIfMissing(
        docId: atalarDocId,
        email: atalarEmail,
        name: atalarName,
      );
      // Ensure clinic 5 doctors
      await seeder.addClinicDoctorsIfMissing();
      if (!mounted) return;
      setState(() {
        _status = 'Done. Redirecting...';
      });
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/splash');
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _status = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            _status,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


