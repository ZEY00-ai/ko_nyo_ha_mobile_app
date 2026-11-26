import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:ko_nyo_ha_mobile_app/core/providers/supabase_provider.dart';

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
      home: const Scaffold(body: Center(child: Text('Ko Nyo Ha'))),
    );
  }
}