import 'package:cloudoe/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system, // Utilise le thème de l'appareil par défaut
      theme: ThemeData.light(), // Thème clair
      darkTheme: ThemeData.dark(),

      home: const HomePage(),
    );
  }
}
