// KNavigationBar.dart fájl
import 'package:flutter/material.dart';

// Konstansok importja
// import '../k_constants.dart'; // Ezt hagyjuk bent, de a hiba miatt ide másoljuk a hiányzó konstanst.

// HIÁNYZÓ KONSTANS DEFINÍCIÓ BEILLESZTVE A HIBAMENTESSÉG ÉRDEKÉBEN
const List<String> kMenuItems = [
  'Destinations',
  'Tours & Activities',
  'About Us',
  'Blog',
  'Contact',
];


class KNavigationBar extends StatelessWidget {
  final bool isWideScreen;
  const KNavigationBar({required this.isWideScreen, super.key});

  // Külön widget a nyelvválasztáshoz
  Widget _buildLanguageSelector(BuildContext context) {
    // Dinamikus színek kinyerése
    final colorScheme = Theme.of(context).colorScheme;
    final onBackground = colorScheme.onBackground; // Sötét szövegszín
    final primaryColor = colorScheme.primary;       // Zöld/Oliva szín

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Fehér háttér (kártyák/felületek színe)
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: onBackground.withOpacity(0.12)), // Halvány keret
      ),
      child: Row(
        children: [
          // Az ikon helyett a 'A' betűt használjuk
          Text(
            'A',
            style: TextStyle(
                fontSize: 16,
                color: primaryColor, // Zöld szín a primary-ból
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'English',
            style: TextStyle(
                fontSize: 14,
                color: onBackground.withOpacity(0.54) // Halványabb sötét szöveg
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 16, color: onBackground.withOpacity(0.54)),
        ],
      ),
    );
  }

  // Külön widget a fő menüpontokhoz
  Widget _buildMenuItems(BuildContext context) {
    // Dinamikus stílusok kinyerése
    final textTheme = Theme.of(context).textTheme;
    final onBackground = Theme.of(context).colorScheme.onBackground;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: kMenuItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            item,
            // bodySmall stílus használata, a kívánt halványabb színnel
            style: textTheme.bodySmall?.copyWith(
              color: onBackground.withOpacity(0.54),
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Külön widget a 'Book a Tour' gombhoz
  Widget _buildBookButton(BuildContext context, {bool isWide = true}) {
    // Dinamikus stílusok kinyerése
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ElevatedButton(
      onPressed: () {},
      // Itt HAGYJUK a stílus beállítását ÜRESEN,
      // mert a stílus már globálisan be van állítva az ElevatedButtonThemeData-ban a k_theme.dart-ban!
      // Csak a padding és a szövegstílus lehet itt, ha eltér a globálistól.
      style: ElevatedButton.styleFrom(
        // Háttérszín már a theme.colorScheme.primary, itt nem kell felülírni
        padding: isWide
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        isWide ? 'Book a Tour' : 'Book',
        // labelLarge használata, ami a gombstílus a k_theme-ben
        style: textTheme.labelLarge?.copyWith(
            fontSize: isWide ? 13 : 12,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primary; // Zöld szín a logóhoz és ikonokhoz

    if (isWideScreen) {
      // === ASZTALI NÉZET ===
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // BAL OLDAL
              _buildLanguageSelector(context),

              // KÖZÉP
              Expanded(
                child: Center(
                  child: _buildMenuItems(context),
                ),
              ),

              // JOBB OLDAL
              _buildBookButton(context, isWide: true),
            ],
          ),
        ),
      );
    } else {
      // === MOBIL NÉZET ===
      return Padding( // Padding a mobilnézethez
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Hamburger ikon
            IconButton(
              icon: Icon(Icons.menu, color: primaryColor), // Zöld ikon
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

            // Logó (ARMONIA)
            Text(
              'ARMONIA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: primaryColor, // Zöld logó
              ),
            ),

            // Gomb (rövidített mobilra)
            _buildBookButton(context, isWide: false),
          ],
        ),
      );
    }
  }
}