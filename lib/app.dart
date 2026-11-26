
import 'package:flutter/material.dart';
import 'core/config/app_mode.dart';
import 'core/theme/app_theme.dart';

class KonoYohaApp extends StatelessWidget {
  final AppMode mode;

  const KonoYohaApp({
    super.key,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KonoYoha',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: mode == AppMode.pengunjung
          ? const PengunjungHomePage()
          : const StaffHomePage(),
    );
  }
}

class PengunjungHomePage extends StatelessWidget {
  const PengunjungHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Halaman Pengunjung'),
      ),
    );
  }
}

class StaffHomePage extends StatelessWidget {
  const StaffHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Halaman Staff'),
      ),
    );
  }
}
