// KTopBar.dart (FONTOS MÓDOSÍTÁSOK)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importok frissítve
import '../k_constants.dart';
import '../k_theme_provider.dart';
import '../k_screen_provider.dart'; // ⬅️ Új Provider importálása

// ---------------------------------------------------------------------
// 🧭 KTopBar OSZTÁLY (Reszponzív Navigációs sáv)
// ---------------------------------------------------------------------
class KTopBar extends StatelessWidget {
  final bool isWideScreen;
  // Új tulajdonság: Melyik menü aktív (false=Témák, true=Képernyők)
  final bool showScreenSelector;

  const KTopBar({required this.isWideScreen, required this.showScreenSelector, super.key});
  // ... (a _buildThemeSelector és _buildLanguageSelector megmarad) ...


  // A _buildLanguageSelector logikája (az eredeti KTopBar.dart-ból)
  Widget _buildLanguageSelector(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final onBackground = colorScheme.onBackground;
    final primaryColor = colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: onBackground.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          Text('A', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text('English', style: TextStyle(fontSize: 14, color: onBackground.withOpacity(0.54))),
          Icon(Icons.keyboard_arrow_down, size: 16, color: onBackground.withOpacity(0.54)),
        ],
      ),
    );
  }


  // A _buildBookButton logikája (az eredeti KTopBar.dart-ból)
  Widget _buildBookButton(BuildContext context, {bool isWide = true}) {
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: isWide
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        isWide ? 'Book a Tour' : 'Book',
        style: textTheme.labelLarge?.copyWith(
            fontSize: isWide ? 13 : 12,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  // ---------------------------------------------------------------------
  // ✨ Téma Választó Menü (KTopBar-ból másolva)
  // ---------------------------------------------------------------------
  Widget _buildThemeSelector(BuildContext context) {
    final themeProvider = Provider.of<KThemeProvider>(context);
    final currentTheme = themeProvider.currentTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final themes = kThemeMenuData;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: themes.map((theme) {
          final KAppThemeType themeType = theme['type'] as KAppThemeType;
          final String themeName = theme['name'] as String;

          final isSelected = currentTheme == themeType;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => themeProvider.setTheme(themeType),
                child: Text(
                  themeName,
                  style: textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onBackground.withOpacity(0.54),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
              if (theme != themes.last)
                Text(
                  '|',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.2)),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }


  // ---------------------------------------------------------------------
  // 🖥️ Képernyő Váltó Menü (Új)
  // ---------------------------------------------------------------------
  Widget _buildScreenSelector(BuildContext context) {
    final screenProvider = Provider.of<KScreenProvider>(context);
    final currentScreen = screenProvider.currentScreen;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final screens = kScreenMenuData;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: screens.map((screen) {
          final KAppScreenType screenType = screen['type'] as KAppScreenType;
          final String screenName = screen['name'] as String;

          final isSelected = currentScreen == screenType;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => screenProvider.setScreen(screenType),
                child: Text(
                  screenName,
                  style: textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onBackground.withOpacity(0.54),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
              if (screen != screens.last)
                Text(
                  '|',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onBackground.withOpacity(0.2)),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // ⏯️ Jobb oldali Váltó Gomb
  // ---------------------------------------------------------------------
  Widget _buildToggleButton(BuildContext context) {
    final screenProvider = Provider.of<KScreenProvider>(context, listen: false);
    final themeProvider = Provider.of<KThemeProvider>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // A váltó gomb szövege attól függ, hogy melyik menü aktív éppen
    final String buttonText = showScreenSelector ? 'Váltás Témákra' : 'Váltás Képernyőkre';

    // A logikát a fő LayoutBuilderben kezeljük, most csak az UI-t adjuk vissza
    return ElevatedButton(
      onPressed: () {
        // A toggle akciót a KTopBar használatának helyén kell kezelni,
        // de itt a gombnyomásra van szükség a váltásra.
        // Helyette most egy egyszerű Navigációs ikont használunk a helyszűke miatt
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(
        buttonText,
        style: textTheme.labelLarge?.copyWith(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  // A Logika most bekerül a Jobb oldali Gomb helyére (Asztali nézet)
  Widget _buildRightPanel(BuildContext context) {
    final screenProvider = Provider.of<KScreenProvider>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // A Váltó Ikon Gomb
        IconButton(
          onPressed: () => screenProvider.toggleScreen(), // Váltás Fokepernyo/Fokepernyo2 között
          icon: Icon(
            showScreenSelector ? Icons.home_work_outlined : Icons.palette_outlined,
            color: colorScheme.primary,
          ),
          tooltip: showScreenSelector ? 'Váltás Főképernyők között' : 'Váltás Témák között',
        ),

        const SizedBox(width: 8),

        // A Korábbi 'Book a Tour' Gomb (megtartva a navigációhoz)
        _buildBookButton(context, isWide: true),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary;

    if (isWideScreen) {
      // === ASZTALI NÉZET ===
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 1. BAL OLDAL
              _buildLanguageSelector(context),

              // 2. KÖZÉPSŐ RÉSZ: DINAMIKUS MENÜ
              Expanded(
                child: Center(
                  // Váltunk a Téma Választó és a Képernyő Választó között
                  child: showScreenSelector
                      ? _buildScreenSelector(context) // Ha true: Képernyő menü
                      : _buildThemeSelector(context), // Ha false: Téma menü
                ),
              ),

              // 3. JOBB OLDAL: VÁLTÓ GOMB ÉS BOOK GOMB
              _buildRightPanel(context),
            ],
          ),
        ),
      );
    } else {
      // === MOBIL NÉZET === (A váltó logika itt is működhetne a menüben)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Hamburger ikon
            IconButton(
              icon: Icon(Icons.menu, color: primaryColor),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

            // Logó
            Text(
              'ARMONIA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: primaryColor,
              ),
            ),

            // Váltó Ikon (Helyszűke miatt csak a Képernyő Váltó marad)
            IconButton(
              onPressed: () => Provider.of<KScreenProvider>(context, listen: false).toggleScreen(),
              icon: Icon(Icons.swap_horiz, color: primaryColor),
              tooltip: 'Képernyő váltása',
            ),
          ],
        ),
      );
    }
  }
}