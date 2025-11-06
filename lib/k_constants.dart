// k_theme_constants.dart

import 'package:flutter/material.dart';

// Mivel a kThemeMenuData használja a KAppThemeType-ot,
// ezt az importot is be kell tennünk (feltételezve, hogy relatíve elérhető)
import 'k_theme_provider.dart';


// =====================================================================
// 1. 🎨 TÉMA SZÍN PALETTÁK (KThemeColors)
// =====================================================================

class KThemeColors {
  // Light / Alap (Esős)
  static const Color primaryGreenLight = Color(0xFF465A41);
  static const Color backgroundOffWhite = Color(0xFFF8F6F0);
  static const Color neutralWhite = Colors.white;
  static const Color neutralBlack = Color(0xFF333333);
  static const Color neutralGrey = Colors.black54;

  // Desert (Naplemente)
  static const Color primaryDesert = Color(0xFFC09B5D);
  static const Color backgroundDesert = Color(0xFFFBF7EF);
  static const Color onBackgroundDesert = Color(0xFF5A4D4A);

  // Forest (Erdő - Sötét téma)
  static const Color primaryForest = Color(0xFF7B9A7B);
  static const Color backgroundForest = Color(0xFF233023);
  static const Color surfaceForest = Color(0xFF3B4A3B);
  static const Color onBackgroundForest = Color(0xFFE8E8E8);

  // Engage (Jegyes - Vörös téma)
  static const Color primaryEngage = Color(0xFFD63230);
  static const Color backgroundEngage = Color(0xFFFEF9F5);
  static const Color onBackgroundEngage = Color(0xFF2C2C2C);
}


// =====================================================================
// 2. 🖼️ TÉMA KÉP ASSET ELÉRÉSI ÚTVONALAK (KThemeAssets)
// =====================================================================

class KThemeAssets {
  // Light / Alap (Esős)
  static const String largeImageUrl = 'assets/eso1.jpg';
  static const String smallImage1Url = 'assets/eso2.jpg';
  static const String smallImage2Url = 'assets/eso3.jpg';
  static const String smallImage3Url = 'assets/eso1.jpg';

  // Desert (Naplemente)
  static const String largeImageDesertUrl = 'assets/arany1.JPG';
  static const String smallImage1DesertUrl = 'assets/arany2.JPG';
  static const String smallImage2DesertUrl = 'assets/naplemente1.JPG';
  static const String smallImage3DesertUrl = 'assets/naplemente2.JPG';

  // Forest (Erdő)
  static const String largeImageForestUrl = 'assets/erdo1.JPG';
  static const String smallImage1ForestUrl = 'assets/erdo2.JPG';
  static const String smallImage2ForestUrl = 'assets/erdo3.JPG';
  static const String smallImage3ForestUrl = 'assets/erdo4.JPG';

  // Engage (Jegyes)
  static const String largeImageEngageUrl = 'assets/jegy1.JPG';
  static const String smallImage1EngageUrl = 'assets/jegy2.JPG';
  static const String smallImage2EngageUrl = 'assets/jegy3.JPG';
  static const String smallImage3EngageUrl = 'assets/jegy4.JPG';
}


// =====================================================================
// 3. 📝 SZÖVEG KONSTANSOK (Gibberish és Menüpontok)
// =====================================================================

// Gibberish szövegek
const String kMenuGibberish = 'MENU';
const String kShortGibberish = 'Sed nisl quam, consectetur vel nibh eu.';
const String kSubTitleGibberish = 'Quisque lacinia eros at tellus egestas.';
const String kTitleGibberish = 'Aliquam mattis justo ut quam, finibus facilisis erat.';
const String kLongGibberish = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere '
    'cubilia curae; Nam vel lacus sit amet libero gravida tristique. '
    'Donec at mi eget ipsum facilisis consequat. ';

// Fő navigációs menüpontok
/// Fő navigációs menüpontok (KDrawer és KNavigationBar számára)
const List<String> kMenuItems = [
  'Destinations',
  'Tours & Activities',
  'About Us',
  'Blog',
  'Contact',
];

// Főoldali ajánlat szekció menüpontok
/// Főoldali ajánlat szekció menüpontok
const List<String> kOfferMenuItems = [
  'Private Tours',
  'Scheduled Tours',
  'Transfers',
  'Wheelchair Accessibility',
];


// =====================================================================
// 4. ✨ TÉMA VÁLASZTÓ ADATOK (KTopBar számára)
// =====================================================================

/// Téma választó menü adatok listája. Minden elem egy Map.
/// `type`: KAppThemeType (a téma beállításához)
/// `name`: String (a felhasználónak megjelenő név)
const List<Map<String, dynamic>> kThemeMenuData = [
  {'type': KAppThemeType.light, 'name': 'LIGHT (Esős)'},
  {'type': KAppThemeType.desert, 'name': 'DESERT (Naplemente)'},
  {'type': KAppThemeType.forest, 'name': 'FOREST (Erdő)'},
  {'type': KAppThemeType.engage, 'name': 'JEGYES (jegyes)'},
];

enum KAppScreenType {
  home1, // Fokepernyo
  home2,
  home3, // Fokepernyo2
}

const List<Map<String, dynamic>> kScreenMenuData = [
  {'name': 'Layout 1 (Armonia)', 'type': KAppScreenType.home1},
  {'name': 'Layout 2 (Poetry)', 'type': KAppScreenType.home2},
  {'name': 'Layout 3 (Magazine)', 'type': KAppScreenType.home3}, // ⬅️ ÚJ
];