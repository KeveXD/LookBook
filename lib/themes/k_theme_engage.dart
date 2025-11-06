// k_theme_engage.dart

import 'package:flutter/material.dart';
import '../k_constants.dart';

class KThemeEngage {
  static ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: KThemeColors.backgroundEngage,

    colorScheme: ColorScheme.fromSeed(
      seedColor: KThemeColors.primaryEngage,
      primary: KThemeColors.primaryEngage,
      background: KThemeColors.backgroundEngage,
      surface: KThemeColors.neutralWhite,
      onBackground: KThemeColors.onBackgroundEngage,
      onSurface: KThemeColors.onBackgroundEngage,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: KThemeColors.neutralWhite,
        backgroundColor: KThemeColors.primaryEngage,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 0,
      ),
    ),
  );
}