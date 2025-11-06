// kepernyok/fokepernyo3.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Téma és widget importok
import 'package:lookbook/widgets/k_drawer.dart';
import 'package:lookbook/widgets/k_top_bar.dart';

import '../k_constants.dart';      // KAppScreenType és konstansok
import '../k_theme_provider.dart';
import '../k_screen_provider.dart'; // KScreenProvider importálva

// ---------------------------------------------------------------------
// ℹ️ Segédmetódus a kép assetek lekérdezésére a téma alapján (JAVÍTVA A FÁJLSTRUKTÚRÁRA)
// ---------------------------------------------------------------------
class KThemeAssets {
  // Feltételezett alap/Light téma (alapértelmezett)
  static const String largeImageUrl = 'assets/arany1.JPG'; // Feltételezett alap kép
  static const String smallImage1Url = 'assets/arany2.JPG';
  static const String smallImage2Url = 'assets/arany3.JPG';
  static const String smallImage3Url = 'assets/arany4.JPG';

  // Desert téma (Feltételezve, hogy ez az 'arany' téma a mintád alapján)
  static const String largeImageDesertUrl = 'assets/arany1.JPG';
  static const String smallImage1DesertUrl = 'assets/arany2.JPG';
  static const String smallImage2DesertUrl = 'assets/arany3.JPG';
  static const String smallImage3DesertUrl = 'assets/arany4.JPG';

  // Forest téma (Feltételezve, hogy ez az 'erdo' téma)
  static const String largeImageForestUrl = 'assets/erdo1.JPG';
  static const String smallImage1ForestUrl = 'assets/erdo2.JPG';
  static const String smallImage2ForestUrl = 'assets/erdo3.JPG';
  static const String smallImage3ForestUrl = 'assets/erdo4.JPG';

  // Engage téma (Feltételezve, hogy ez az 'ember' téma)
  // Mivel kevesebb Engage képed van a mintában, itt ismételjük a "small" képeket
  static const String largeImageEngageUrl = 'assets/ember.JPG';
  static const String smallImage1EngageUrl = 'assets/ember.JPG'; // ⬅️ Kép a fő szekcióhoz
  static const String smallImage2EngageUrl = 'assets/ember.JPG'; // ⬅️ Kép a kis blokkhoz
  static const String smallImage3EngageUrl = 'assets/ember.JPG';
}

class ThemeAssets {
  final String largeImageUrl;
  final String smallImage1Url;
  final String smallImage2Url;
  final String smallImage3Url;

  const ThemeAssets({
    required this.largeImageUrl,
    required this.smallImage1Url,
    required this.smallImage2Url,
    required this.smallImage3Url,
  });
}

ThemeAssets _getThemeAssets(BuildContext context) {
  final themeType = Provider.of<KThemeProvider>(context, listen: false).currentTheme;

  switch (themeType) {
    case KAppThemeType.desert:
      return ThemeAssets(
        largeImageUrl: KThemeAssets.largeImageDesertUrl,
        smallImage1Url: KThemeAssets.smallImage1DesertUrl,
        smallImage2Url: KThemeAssets.smallImage2DesertUrl,
        smallImage3Url: KThemeAssets.smallImage3DesertUrl,
      );
    case KAppThemeType.forest:
      return ThemeAssets(
        largeImageUrl: KThemeAssets.largeImageForestUrl,
        smallImage1Url: KThemeAssets.smallImage1ForestUrl,
        smallImage2Url: KThemeAssets.smallImage2ForestUrl,
        smallImage3Url: KThemeAssets.smallImage3ForestUrl,
      );
    case KAppThemeType.engage:
      return ThemeAssets(
        largeImageUrl: KThemeAssets.largeImageEngageUrl,
        smallImage1Url: KThemeAssets.smallImage1EngageUrl,
        smallImage2Url: KThemeAssets.smallImage2EngageUrl,
        smallImage3Url: KThemeAssets.smallImage3EngageUrl,
      );
    case KAppThemeType.light:
    case KAppThemeType.custom:
    default:
      return const ThemeAssets(
        largeImageUrl: KThemeAssets.largeImageUrl,
        smallImage1Url: KThemeAssets.smallImage1Url,
        smallImage2Url: KThemeAssets.smallImage2Url,
        smallImage3Url: KThemeAssets.smallImage3Url,
      );
  }
}

// ---------------------------------------------------------------------
// 📄 Fokepernyo3 OSZTÁLY
// ---------------------------------------------------------------------
class Fokepernyo3 extends StatelessWidget {
  const Fokepernyo3({super.key});

  static const double mobileBreakpoint = 600;

  // --- Konstansok ehhez az oldalhoz ---
  static const String _mainTitle = 'CHOOSE\nYOUR WAY';
  static const String _bodyText1 =
      'To create your own, choose a topic that interests you. It can be anything '
      'from fashion and beauty to travel and the news. Once you have your '
      'overall theme, you can start brainstorming the content.';
  static const String _bodyText2 =
      'Just starting? Design a memorable masthead with an equally memorable '
      'name. This goes on the cover and sets up the branding for your entire magazine.';
  static const String _quote = '“You automatically lose the\nchances you don’t take.”';
  static const String _quoteAuthor = '— @reallygreatsite';

  // ---------------------------------------------------------------------
  // 🖼️ _buildHeroSection
  // ---------------------------------------------------------------------
  Widget _buildHeroSection(BuildContext context, {required bool isWideScreen}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // ⬅️ KÉPEK LEKÉRÉSE A TÉMÁBÓL
    final currentAssets = _getThemeAssets(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 80.0 : 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isWideScreen ? 60 : 40),
          // Cím
          Stack(
            children: [
              Text(
                _mainTitle,
                style: textTheme.displayLarge?.copyWith(
                  fontSize: isWideScreen ? 72 : 48,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onBackground,
                  height: 1.0,
                ),
              ),
              // Vonal a jobb felső sarokban
              Positioned(
                top: 0,
                right: isWideScreen ? 0 : -20,
                child: Transform.rotate(
                  angle: -0.2,
                  child: Container(
                    width: isWideScreen ? 100 : 70,
                    height: 2,
                    color: colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isWideScreen ? 60 : 40),
          // Kép és szöveg blokk
          isWideScreen
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.asset(
                      // ⬅️ TÉMA KÉP HASZNÁLATA (smallImage1Url)
                      currentAssets.smallImage1Url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: isWideScreen ? 40 : 20),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _bodyText1,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.8),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      _bodyText2,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.8),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Kis kép a jobb alsó sarokban
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: isWideScreen ? 180 : 120,
                          child: Image.asset(
                            // ⬅️ TÉMA KÉP HASZNÁLATA (smallImage2Url)
                            currentAssets.smallImage2Url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : // Mobil nézet
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Image.asset(
                    // ⬅️ TÉMA KÉP HASZNÁLATA
                    currentAssets.smallImage1Url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _bodyText1,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _bodyText2,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 120, // Mobil nézetben fix szélesség
                    child: Image.asset(
                      // ⬅️ TÉMA KÉP HASZNÁLATA
                      currentAssets.smallImage2Url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isWideScreen ? 60 : 40),
          // Idézet szekció
          Center(
            child: Column(
              children: [
                Container(
                  width: isWideScreen ? 400 : double.infinity,
                  height: 1,
                  color: colorScheme.onBackground.withOpacity(0.3),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),
                Text(
                  _quote,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall?.copyWith(
                    fontFamily: 'Keziras',
                    fontSize: isWideScreen ? 30 : 24,
                    color: colorScheme.onBackground,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _quoteAuthor,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground.withOpacity(0.7),
                  ),
                ),
                Container(
                  width: isWideScreen ? 400 : double.infinity,
                  height: 1,
                  color: colorScheme.onBackground.withOpacity(0.3),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: isWideScreen ? 60 : 40),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // ⬇️ _buildBottomSection
  // ---------------------------------------------------------------------
  Widget _buildBottomSection(BuildContext context, {bool isMobile = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: colorScheme.surface,
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: isMobile ? 20.0 : 100.0),
      child: Column(
        children: <Widget>[
          // Cím (ARMONIA EXCURSIONS)
          Text(
            'ARMONIA EXCURSIONS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          // Copyright
          Text(
            '© 2024. Donec quis mi. All rights reserved.',
            style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.38)),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Figyeljük a KScreenProvider-t
    final screenProvider = Provider.of<KScreenProvider>(context);

    // showScreenSelector a home3-at figyeli
    final bool showScreenSelector = screenProvider.currentScreen == KAppScreenType.home3;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > mobileBreakpoint;

        final List<Widget> pageContent = [
          _buildHeroSection(context, isWideScreen: isWideScreen),
          _buildBottomSection(context, isMobile: !isWideScreen),
        ];

        // ASZTALI/SZÉLES NÉZET
        if (isWideScreen) {
          return Scaffold(
            backgroundColor: colorScheme.background,
            body: Column(
              children: [
                KTopBar(
                  isWideScreen: true,
                  showScreenSelector: showScreenSelector,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pageContent,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // MOBIL/KESKENY NÉZET
        return Scaffold(
          backgroundColor: colorScheme.background,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: KTopBar(
              isWideScreen: false,
              showScreenSelector: showScreenSelector,
            ),
            toolbarHeight: 70,
            backgroundColor: colorScheme.background,
            elevation: 0,
          ),
          drawer: const KDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pageContent,
            ),
          ),
        );
      },
    );
  }
}
