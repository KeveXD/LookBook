// (Ez a kód egy külön 'k_theme.dart' fájlban van)
import 'package:flutter/material.dart';

class KThemeColors {
  static const Color primaryGreen = Color(0xFF465A41);
  static const Color backgroundOffWhite = Color(0xFFF8F6F0);
  static const Color neutralWhite = Colors.white;
  static const Color neutralBlack = Color(0xFF333333);
  static const Color neutralGrey = Colors.black54;
  static const Color dividerColor = Colors.black12;
}

class KThemeAssets {
  static const String largeImageUrl = 'assets/eso1.jpg'; // Vagy 'https://picsum...'
  static const String smallImage1Url = 'assets/eso2.jpg';
  static const String smallImage2Url = 'assets/eso3.jpg';
  static const String smallImage3Url = 'assets/eso1.jpg';
}

class KThemeData {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: KThemeColors.backgroundOffWhite,
    colorScheme: ColorScheme.fromSeed(
      seedColor: KThemeColors.primaryGreen,
      primary: KThemeColors.primaryGreen,
      background: KThemeColors.backgroundOffWhite,
      surface: KThemeColors.neutralWhite,
    ),
    // ... további téma beállítások ...
  );
}