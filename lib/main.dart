import 'package:flutter/material.dart';

import 'shared/widgets/custom_button.dart';
import 'shared/widgets/loading_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Reusable Components')),
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
