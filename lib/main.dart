import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ko_nyo_ha_mobile_app/core/providers/supabase_provider.dart';
import 'shared/widgets/custom_button.dart';
import 'shared/widgets/loading_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseProvider.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => SupabaseProvider(),
      child: const KoNyoHaApp(),
    ),
  );
}

class KoNyoHaApp extends StatelessWidget {
  const KoNyoHaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ko Nyo Ha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Ko Nyo Ha')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomButton(
                text: 'Masuk',
                onPressed: () async {
                  // Simulasi proses (ganti dengan request login, dll)
                  await Future.delayed(const Duration(seconds: 3));
                  debugPrint('Selesai');
                },
              ),
              const SizedBox(height: 25),
              const Expanded(child: LoadingWidget()),
            ],
          ),
        ),
      ),
    );
  }
}