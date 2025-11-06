// k_screen_provider.dart

import 'package:flutter/material.dart';
import 'k_constants.dart'; // A KAppScreenType importálása

class KScreenProvider extends ChangeNotifier {
  KAppScreenType _currentScreen = KAppScreenType.home1;

  // Getter: lekérdezi az aktuális képernyőt
  KAppScreenType get currentScreen => _currentScreen;

  // Setter: beállítja az új képernyőt és értesíti a hallgatókat
  void setScreen(KAppScreenType newScreen) {
    if (newScreen != _currentScreen) {
      _currentScreen = newScreen;
      notifyListeners();
    }
  }

  // Váltás a két képernyő között
  void toggleScreen() {
    _currentScreen = _currentScreen == KAppScreenType.home1
        ? KAppScreenType.home2
        : KAppScreenType.home1;
    notifyListeners();
  }
}