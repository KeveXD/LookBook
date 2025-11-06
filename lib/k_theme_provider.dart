// k_theme_provider.dart

import 'package:flutter/material.dart';
import 'package:lookbook/themes/k_theme_desert.dart';
import 'package:lookbook/themes/k_theme_engage.dart';
import 'package:lookbook/themes/k_theme_forest.dart';
import 'package:lookbook/themes/k_theme_light.dart';


enum KAppThemeType { light, desert, forest, engage, custom }

class KThemeProvider extends ChangeNotifier {
  KAppThemeType _currentTheme = KAppThemeType.light;

  KAppThemeType get currentTheme => _currentTheme;

  ThemeData get themeData {
    switch (_currentTheme) {
      case KAppThemeType.desert:
        return KThemeDesert.theme;
      case KAppThemeType.forest:
        return KThemeForest.theme;
      case KAppThemeType.engage: // <<< ENGAGE
        return KThemeEngage.theme; // <<< Hivatkozás az új osztályra
      case KAppThemeType.light:
        return KThemeLight.theme;
      case KAppThemeType.custom:
        return KThemeLight.theme.copyWith(
          colorScheme: KThemeLight.theme.colorScheme.copyWith(
            primary: Colors.deepPurple,
          ),
        );
      default:
        return KThemeLight.theme;
    }
  }

  void setTheme(KAppThemeType newTheme) {
    if (_currentTheme != newTheme) {
      _currentTheme = newTheme;
      notifyListeners();
    }
  }
}