// k_theme_forest.dart

import 'package:flutter/material.dart';
import '../k_constants.dart';

class KThemeForest {
  static ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: KThemeColors.backgroundForest,

    colorScheme: ColorScheme.fromSeed(
      seedColor: KThemeColors.primaryForest,
      brightness: Brightness.dark,
      primary: KThemeColors.primaryForest,
      background: KThemeColors.backgroundForest,
      surface: KThemeColors.surfaceForest,
      onBackground: KThemeColors.onBackgroundForest,
      onSurface: KThemeColors.onBackgroundForest,
    ),

    textTheme: const TextTheme().apply(
      bodyColor: KThemeColors.onBackgroundForest,
      displayColor: KThemeColors.onBackgroundForest,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: KThemeColors.surfaceForest,
      foregroundColor: KThemeColors.onBackgroundForest,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: KThemeColors.backgroundForest,
        backgroundColor: KThemeColors.primaryForest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 0,
      ),
    ),
  );
}