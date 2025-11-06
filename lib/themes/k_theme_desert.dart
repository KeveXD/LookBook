// k_theme_desert.dart

import 'package:flutter/material.dart';
import '../k_constants.dart';

class KThemeDesert {
  static ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: KThemeColors.backgroundDesert,

    colorScheme: ColorScheme.fromSeed(
      seedColor: KThemeColors.primaryDesert,
      primary: KThemeColors.primaryDesert,
      background:   KThemeColors.backgroundDesert,
      surface: KThemeColors.backgroundDesert,
      onBackground: KThemeColors.onBackgroundDesert,
      onSurface: KThemeColors.onBackgroundDesert,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: KThemeColors.neutralWhite,
        backgroundColor: KThemeColors.primaryDesert,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 0,
      ),
    ),
  );
}