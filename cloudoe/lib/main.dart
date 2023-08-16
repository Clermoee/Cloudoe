import 'package:cloudoe/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting(
      'fr_FR', null); // Initialisez la localisation française

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudoe',

      themeMode: ThemeMode.system, // Utilise le thème de l'appareil par défaut
      theme: ThemeData.light().copyWith(), // Thème clair
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
