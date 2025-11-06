// Fokepernyo2.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Téma és widget importok
import 'package:lookbook/widgets/k_drawer.dart';
import 'package:lookbook/widgets/k_top_bar.dart';

import '../k_constants.dart';
import '../k_theme_provider.dart';
import '../k_screen_provider.dart'; // ⬅️ ÚJ: Screen Provider importálva

// ---------------------------------------------------------------------
// ℹ️ Segédmetódus a kép assetek lekérdezésére a téma alapján
// ---------------------------------------------------------------------
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

// ---------------------------------------------------------------------
// 🖼️ Segédmetódus a téma assetek lekérésére
// ---------------------------------------------------------------------
ThemeAssets _getThemeAssets(BuildContext context) {
  // A listen: false azért használható itt, mert a téma változását a fő build() kezeli.
  final themeType = Provider.of<KThemeProvider>(context, listen: false).currentTheme;

  // Feltételezzük, hogy a KThemeAssets és KAppThemeType a k_constants.dart vagy k_theme.dart fájlból jön.
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
    // Light téma (alapértelmezett)
      return const ThemeAssets(
        largeImageUrl: KThemeAssets.largeImageUrl,
        smallImage1Url: KThemeAssets.smallImage1Url,
        smallImage2Url: KThemeAssets.smallImage2Url,
        smallImage3Url: KThemeAssets.smallImage3Url,
      );
  }
}

// ---------------------------------------------------------------------
// 📄 Fokepernyo2 OSZTÁLY (Poszter Elrendezés)
// ---------------------------------------------------------------------
class Fokepernyo2 extends StatelessWidget {
  const Fokepernyo2({super.key});

  static const double mobileBreakpoint = 800; // Enyhén lejjebb vesszük a mobil nézet határát
  // Konstansok hiányoznak, de feltételezzük, hogy az alábbiak a k_constants.dart-ban vannak:
  /*
  const String kLongGibberish = '...';
  const String kShortGibberish = '...';
  */

  // ---------------------------------------------------------------------
  // 📜 _buildPoetrySection (A poszter fő tartalma)
  // ---------------------------------------------------------------------
  Widget _buildPoetrySection(BuildContext context, {required bool isWideScreen}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final currentAssets = _getThemeAssets(context);

    // A Card szélessége limitálva van a jobb megjelenés érdekében
    final double cardWidth = isWideScreen ? 700 : double.infinity;
    final double padding = isWideScreen ? 40 : 20;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: cardWidth),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: colorScheme.background, // A téma háttérszíne
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. BAL OLDAL: POÉZIS ÉS CÍMEK
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Fő cím (POETRY)
                      Text(
                        'POETRY',
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: isWideScreen ? 64 : 48,
                          fontWeight: FontWeight.w100,
                          color: colorScheme.onBackground,
                          letterSpacing: 1.0,
                        ),
                      ),
                      // Alcím (of the week)
                      Text(
                        'of the week',
                        style: textTheme.headlineSmall?.copyWith(
                          fontSize: isWideScreen ? 32 : 24,
                          fontFamily: 'Keziras', // Kézírásos font használata
                          color: colorScheme.primary, // Akcentusz szín
                          height: 1.0,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Vers (Egyszerű szöveg, bodyLarge stílussal)
                      // Védőblokk: ha a konstans hiányzik
                      Text(
                        (kLongGibberish ?? 'Lorem ipsum dolor sit amet') + (kLongGibberish ?? ' ...'), // Hosszabb szöveg a kLongGibberish-ből
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onBackground.withOpacity(0.8),
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Aláírás/Kapcsolat (Kézírásos font)
                      Text(
                        '— ARMONIA EXCURSIONS',
                        style: textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Keziras',
                          fontSize: isWideScreen ? 18 : 16,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Lábjegyzet
                      Text(
                        '#905 - ${kShortGibberish ?? 'Sed nisl quam'}',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onBackground.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. JOBB OLDAL: KÉP (Csak széles nézetben)
                if (isWideScreen) ...[
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 3 / 4, // Magasabb, mint széles
                        child: Image.asset(
                          currentAssets.smallImage1Url, // A kisebb kép assetet használjuk
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
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

    // ➡️ 1. Figyeljük a KScreenProvider-t (listen: true kell)
    final screenProvider = Provider.of<KScreenProvider>(context);

    // ➡️ 2. Meghatározzuk a showScreenSelector állapotát
    // Mivel ez az Fokepernyo2 (a második képernyő), a KTopBar mutassa a Képernyő Választó menüt (true).
    final bool showScreenSelector = screenProvider.currentScreen == KAppScreenType.home2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > mobileBreakpoint;

        final List<Widget> pageContent = [
          // A fő tartalom: a poszter/kártya
          _buildPoetrySection(context, isWideScreen: isWideScreen),
          // Alsó lábléc
          _buildBottomSection(context, isMobile: !isWideScreen),
        ];

        // 1. ASZTALI/SZÉLES NÉZET
        if (isWideScreen) {
          return Scaffold(
            // A KTopBar széles nézetben a ScrollView fölé kerül
            body: Column(
              children: [
                // ➡️ Módosított KTopBar hívás (kötelező paraméterrel!)
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

        // 2. MOBIL/KESKENY NÉZET
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // ➡️ Módosított KTopBar hívás (kötelező paraméterrel!)
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