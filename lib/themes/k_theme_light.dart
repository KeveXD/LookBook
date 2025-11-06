// k_theme_light.dart

import 'package:flutter/material.dart';
import '../k_constants.dart';

class KThemeLight {
  static ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: KThemeColors.backgroundOffWhite,

    colorScheme: ColorScheme.fromSeed(
      seedColor: KThemeColors.primaryGreenLight,
      primary: KThemeColors.primaryGreenLight,
      background: KThemeColors.backgroundOffWhite,
      surface: KThemeColors.neutralWhite,
      onBackground: KThemeColors.neutralBlack,
      onSurface: KThemeColors.neutralBlack,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: KThemeColors.neutralWhite,
        backgroundColor: KThemeColors.primaryGreenLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 0,
      ),
    ),
  );
}