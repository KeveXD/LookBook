// Fokepernyo.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // A téma eléréséhez szükséges

// ---------------------------------------------------------------------
// Helyes Importok a Téma és Képernyő Kezeléshez:
// ---------------------------------------------------------------------
import 'package:lookbook/widgets/k_drawer.dart';
import 'package:lookbook/widgets/k_top_bar.dart';
import '../k_constants.dart';      // KAppScreenType és konstansok
import '../k_theme_provider.dart';
import '../k_screen_provider.dart'; // ⬅️ ÚJ: Screen Provider importálva

// TÉMA FÁJLOK HELYES IMPORTÁLÁSA
// ... (feltételezve, hogy a KThemeAssets a k_theme_constants.dart-ból jön)


// ---------------------------------------------------------------------
// 📦 HIÁNYZÓ KONSTANS DEFINÍCIÓK (az áttekinthetőség kedvéért a fájlban tartva)
// ---------------------------------------------------------------------
const List<String> kMenuItems = [
  'Destinations',
  'Tours & Activities',
  'About Us',
  'Blog',
  'Contact',
];

// Gibberish konstansok
const String kMenuGibberish = 'MENU';
const String kShortGibberish = 'Sed nisl quam, consectetur vel nibh eu.';
const String kSubTitleGibberish = 'Quisque lacinia eros at tellus egestas.';
const String kTitleGibberish = 'Aliquam mattis justo ut quam, finibus facilisis erat.';
const String kLongGibberish = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere '
    'cubilia curae; Nam vel lacus sit amet libero gravida tristique. '
    'Donec at mi eget ipsum facilisis consequat. ';


const List<String> kOfferMenuItems = [
  'Private Tours',
  'Scheduled Tours',
  'Transfers',
  'Wheelchair Accessibility',
];

// Segéd osztály a dinamikusan kiválasztott asset hivatkozások tárolására
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

class Fokepernyo extends StatelessWidget {
  const Fokepernyo({super.key});

  // Mobil nézet határa (maradhat statikus)
  static const double mobileBreakpoint = 1000;

  // ---------------------------------------------------------------------
  // ℹ️ Segédmetódus a kép assetek lekérdezésére a téma alapján
  // ---------------------------------------------------------------------
  ThemeAssets _getThemeAssets(BuildContext context) {
    // Lekérdezi az aktuális témát a Provideren keresztül
    // A KThemeProvider és KAppThemeType a k_theme_provider.dart fájlból jön.
    final themeType = Provider.of<KThemeProvider>(context).currentTheme;

    // A KThemeAssets a k_theme_constants.dart fájlból jön.
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
  // 📜 _buildHeaderContent
  // ---------------------------------------------------------------------
  Widget _buildHeaderContent(BuildContext context, {required bool isWideScreen}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final double horizontalPadding = isWideScreen ? 40.0 : 20.0;

    // Stílusok a textTheme-ből:
    final mainTitleStyle = textTheme.displayLarge?.copyWith(
      fontSize: isWideScreen ? 50 : 36,
      color: colorScheme.primary, // Zöld/Oliva szín
    );

    final descTextStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.onBackground.withOpacity(0.7), // Halványabb sötét
    );


    return Padding(
      padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          isWideScreen ? 60 : 20,
          horizontalPadding,
          isWideScreen ? 20 : 15
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. FŐ CÍM
          Text(
            'ARMONIA\nEXCURSIONS',
            style: mainTitleStyle,
          ),

          SizedBox(height: isWideScreen ? 20 : 15),

          // 2. LEÍRÓ SZÖVEGEK
          isWideScreen
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // BAL OLDALI LEÍRÁS
              SizedBox(
                width: 300,
                child: Text(
                  'The most popular and trusted travel agency in Greece',
                  style: descTextStyle,
                ),
              ),

              // JOBB OLDALI GOMB/SZÖVEG
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    kMenuGibberish,
                    style: descTextStyle?.copyWith(
                      color: colorScheme.primary, // Zöld szín
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.primary,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 16, color: colorScheme.primary),
                ],
              ),
            ],
          )
              : // Mobil nézet
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The most popular and trusted travel agency in Greece',
                style: descTextStyle,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    kMenuGibberish,
                    style: descTextStyle?.copyWith(
                      color: colorScheme.primary, // Zöld szín
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.primary,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 16, color: colorScheme.primary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // 🖼️ _buildHeroSection (Dinamikus Képválasztás)
  // ---------------------------------------------------------------------
  Widget _buildHeroSection(BuildContext context, {required bool isWideScreen}) {
    final bool isMobile = !isWideScreen;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // KÉPEK LEKÉRÉSE AZ AKTUÁLIS TÉMA ALAPJÁN
    final currentAssets = _getThemeAssets(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
      child: Stack(
        alignment: isMobile ? Alignment.bottomLeft : Alignment.topRight,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: double.infinity,
              height: isMobile ? 300 : 400,
              child: Image.asset(
                currentAssets.largeImageUrl, // <<< DINAMIKUS HASZNÁLAT
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: isMobile ? null : 20,
            right: isMobile ? null : 20,
            bottom: isMobile ? 20 : null,
            left: isMobile ? 20 : null,
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                // Szövegek a képen (fehér)
                Text(
                  kShortGibberish,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withOpacity(0.7)),
                ),
                Text(
                  kSubTitleGibberish,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withOpacity(0.7)),
                ),
                const SizedBox(height: 10),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: colorScheme.onPrimary.withOpacity(0.7), width: 1.0)),
                  ),
                  child: Text(
                    kMenuGibberish,
                    style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary.withOpacity(0.7),
                        letterSpacing: 1.0
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // ✨ _buildComfortSection (Dinamikus Képválasztás)
  // ---------------------------------------------------------------------
  Widget _buildComfortSection(BuildContext context, {required bool isWideScreen}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // KÉPEK LEKÉRÉSE AZ AKTUÁLIS TÉMA ALAPJÁN
    final currentAssets = _getThemeAssets(context);

    final children = <Widget>[
      Expanded(
        flex: isWideScreen ? 1 : 0,
        child: Padding(
          padding: EdgeInsets.only(right: isWideScreen ? 20.0 : 0, bottom: isWideScreen ? 0 : 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.asset(
                currentAssets.smallImage1Url, // <<< DINAMIKUS HASZNÁLAT
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: isWideScreen ? 2 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 0 : 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Kisebb cím
              Text(
                '• NEC ETIAM',
                style: textTheme.labelMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Fő cím
              Text(
                kTitleGibberish,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w100, // Light (vagy amit a témában beállítottál)
                  color: colorScheme.onBackground,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 15),
              // Kézírásos szöveg (kLongGibberish)
              Text(
                kLongGibberish + kLongGibberish,
                style: textTheme.displayLarge?.copyWith(
                  // VÁLTOZTATÁS: Beállítjuk a 'Keziras' fontot
                  fontFamily: 'Keziras',
                  // VÁLTOZTATÁS: A méretet a bodyLarge-hoz hasonlónak állítjuk be, hogy ne legyen túl nagy
                  fontSize: isWideScreen ? 18 : 16,
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),
              // Alsó vonal
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: colorScheme.onBackground.withOpacity(0.7), width: 1.0)),
                ),
                child: Text(
                  'DISCE QUID SIT',
                  style: textTheme.labelSmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.7), letterSpacing: 1.0),
                ),
              ),
              if (!isWideScreen) const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      Expanded(
        flex: isWideScreen ? 1 : 0,
        child: Padding(
          padding: EdgeInsets.only(left: isWideScreen ? 20.0 : 0, top: isWideScreen ? 0 : 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.asset(
                currentAssets.smallImage2Url, // <<< DINAMIKUS HASZNÁLAT
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: isWideScreen
          ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: children)
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  // ---------------------------------------------------------------------
  // 🎁 _buildOfferSection - Menü gomb
  // ---------------------------------------------------------------------
  Widget _buildOfferMenuButton(BuildContext context, String title, {bool isSelected = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color backgroundColor = isSelected ? colorScheme.primary : colorScheme.surface;
    final Color textColor = isSelected ? colorScheme.onPrimary : colorScheme.onBackground;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: isSelected ? colorScheme.primary : colorScheme.onBackground.withOpacity(0.1),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: textColor,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // 🎁 _buildOfferSection - Kártya (Dinamikus Képválasztás)
  // ---------------------------------------------------------------------
  Widget _buildOfferDetailCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // KÉPEK LEKÉRÉSE AZ AKTUÁLIS TÉMA ALAPJÁN
    final currentAssets = _getThemeAssets(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              currentAssets.smallImage3Url, // <<< DINAMIKUS HASZNÁLAT
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Felső cím
        Text(
          'AS YOU WISH',
          style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.7),
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 5),
        // Fő cím
        Text(
          'Tailored Private Tours in Mercedes Vito',
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 15),
        // Leírás
        Text(
          kLongGibberish,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onBackground.withOpacity(0.7), height: 1.5),
        ),
        const SizedBox(height: 15),
        // Checkbox
        Row(
          children: [
            Icon(Icons.check_circle_outline, size: 16, color: colorScheme.primary),
            const SizedBox(width: 8),
            Text(
                'Perfect for those seeking a premium experience.',
                style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground)
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Alsó vonal
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: colorScheme.primary, width: 1.0)),
          ),
          child: Text(
            'EXPLORE TOURS',
            style: textTheme.labelMedium?.copyWith(
                color: colorScheme.primary,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOfferSection(BuildContext context, {required bool isWideScreen}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final double horizontalPadding = isWideScreen ? 40.0 : 20.0;

    final Widget content = isWideScreen
        ? Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 250,
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: kOfferMenuItems.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildOfferMenuButton(context, item, isSelected: item == kOfferMenuItems.first),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: _buildOfferDetailCard(context),
        ),
      ],
    )
        :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildOfferDetailCard(context),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: kOfferMenuItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildOfferMenuButton(context, item, isSelected: item == kOfferMenuItems.first),
            );
          }).toList(),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                // Felső cím
                Text(
                  'SERVICES',
                  style: textTheme.labelMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                // Fő cím
                Text(
                  'What we offer?',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onBackground,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          content,
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // ⬇️ _buildBottomSection (Alsó rész)
  // ---------------------------------------------------------------------
  Widget _buildBottomSection(BuildContext context, {bool isMobile = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: colorScheme.surface, // Kártya/felszín színe
      padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: isMobile ? 20.0 : 100.0),
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
          // Linkek
          Wrap(
            spacing: 30.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text('Amet Erat Et', style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.7))),
              Text('Consectetur', style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.7))),
              Text('Adipiscing', style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.7))),
            ],
          ),
          const SizedBox(height: 40),
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
    final textTheme = Theme.of(context).textTheme;

    // ➡️ 1. Figyeljük a KScreenProvider-t
    // Listen: true szükséges, hogy a build újrainduljon, ha a KScreenProvider változik!
    final screenProvider = Provider.of<KScreenProvider>(context);

    // ➡️ 2. Meghatározzuk a showScreenSelector állapotát
    // Ha a Képernyő Választó menü (Screen Selector) aktív, amikor a felhasználó az home2 (Poetry) nézetben van,
    // akkor legyen true. Mivel ez az Fokepernyo (home1), akkor a Téma Választót (false) akarjuk látni.
    final bool showScreenSelector = screenProvider.currentScreen == KAppScreenType.home2;


    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > mobileBreakpoint;

        // Fő tartalomlista
        final List<Widget> pageContent = [
          _buildHeaderContent(context, isWideScreen: isWideScreen),

          _buildHeroSection(context, isWideScreen: isWideScreen),

          // Elválasztó cím
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 40.0 : 20.0, vertical: 30.0),
            child: Text(
              'Ratione Voluptatem',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildComfortSection(context, isWideScreen: isWideScreen),

          _buildOfferSection(context, isWideScreen: isWideScreen),

          _buildBottomSection(context, isMobile: !isWideScreen),
        ];

        // 1. ASZTALI/SZÉLES NÉZET
        if (isWideScreen) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // ➡️ Módosított KTopBar hívás (kötelező showScreenSelector paraméterrel!)
                  KTopBar(
                    isWideScreen: true,
                    showScreenSelector: showScreenSelector,
                  ),
                  ...pageContent,
                ],
              ),
            ),
          );
        }

        // 2. MOBIL/KESKENY NÉZET
        return Scaffold(
          // Felső sáv (AppBar)
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // A KTopBar már dinamikus
            // ➡️ Módosított KTopBar hívás (kötelező showScreenSelector paraméterrel!)
            title: KTopBar(
              isWideScreen: false,
              showScreenSelector: showScreenSelector,
            ),
            toolbarHeight: 70,
            backgroundColor: colorScheme.background, // Krém háttérszín
            elevation: 0,
          ),
          // Oldalsó menü (Drawer)
          drawer: const KDrawer(), // A KDrawer is dinamikus
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