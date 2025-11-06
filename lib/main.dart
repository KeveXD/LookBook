// main.dart

import 'package:flutter/material.dart';
// Szükséges csomag a témastátusz kezeléséhez
import 'package:provider/provider.dart';

// Importáljuk a szükséges fájlokat és a KScreenProvider-t
import 'kepernyok/fokepernyo.dart';
import 'kepernyok/fokepernyo2.dart';
import 'kepernyok/fokepernyo3.dart';
import 'themes/k_theme.dart';
import 'k_constants.dart';
import 'k_theme_provider.dart';
import 'k_screen_provider.dart'; // ⬅️ ÚJ: A képernyőváltó Provider

// ---------------------------------------------------------------------
// 🚀 MAIN FÜGGVÉNY
// ---------------------------------------------------------------------
void main() {
  // A teljes alkalmazást be kell csomagolni a MultiProvider-be.
  runApp(
    MultiProvider(
      providers: [
        // 1. Téma Provider inicializálása
        ChangeNotifierProvider(create: (_) => KThemeProvider()),
        // 2. Képernyő Provider inicializálása
        ChangeNotifierProvider(create: (_) => KScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// ---------------------------------------------------------------------
// 🎨 MYAPP OSZTÁLY (Az alkalmazás gyökere)
// ---------------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Téma Provider figyelése
    final themeProvider = Provider.of<KThemeProvider>(context);

    // 2. Képernyő Provider figyelése
    final screenProvider = Provider.of<KScreenProvider>(context);

    // Képernyő kiválasztása a Provider állapota alapján
    final Widget activeScreen =
    screenProvider.currentScreen == KAppScreenType.home1
        ? const Fokepernyo()
        : screenProvider.currentScreen == KAppScreenType.home2
        ? const Fokepernyo2()
        : const Fokepernyo3(); // ⬅️ ÚJ Fokepernyo3// Ezt a logikát a k_constants.dart-ból származó enum alapozza meg

    return MaterialApp(
      debugShowCheckedModeBanner: false, // kikapcsolva a jobb megjelenésért
      title: 'Armonia Excursions Design',

      // A 'themeData' getterrel állítjuk be a témát.
      theme: themeProvider.themeData,

      // A dinamikusan kiválasztott képernyő beállítása
      home: activeScreen,
    );
  }
}