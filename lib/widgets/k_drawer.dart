// KDrawer.dart fájl
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Téma és Konstans Importok
import '../k_constants.dart';
import '../k_theme_provider.dart';  // A KThemeProvider és KAppThemeType importálása

// ---------------------------------------------------------------------
// 🚪 KDrawer OSZTÁLY (Oldalsó menü mobilra)
// ---------------------------------------------------------------------
class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Az aktuális Téma adatok kinyerése
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // 2. A Provider kinyerése a téma váltásához
    final themeProvider = Provider.of<KThemeProvider>(context);
    final currentTheme = themeProvider.currentTheme;

    // 3. Színek
    final kPrimaryColor = colorScheme.primary;
    final kBackgroundColor = theme.scaffoldBackgroundColor;

    // 4. Konstansok betöltése az egyesített fájlból (k_theme_constants.dart)
    // Most már minden konstans itt elérhető az osztályok nélkül:
    final List<String> menuItems = kMenuItems;
    final List<Map<String, dynamic>> themeMenuData = kThemeMenuData;


    return Drawer(
      backgroundColor: kBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Fejléc
          DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fő cím (pl. ARMONIA EXCURSIONS)
                Text(
                  'ARMONIA EXCURSIONS',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.language, color: colorScheme.onPrimary.withOpacity(0.7), size: 18),
                    const SizedBox(width: 4),
                    Text(
                      'English',
                      style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimary.withOpacity(0.7)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menüpontok
          ...menuItems.map((item) {
            return ListTile(
              title: Text(
                item,
                style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onBackground
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigációs logika hozzáadása itt...
              },
            );
          }).toList(),
          const Divider(),

          // -----------------------------------------------------------
          // ✨ TÉMA VÁLASZTÓ SZEKCIÓ (ÚJ)
          // -----------------------------------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
            child: Text(
              'Téma kiválasztása:',
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Téma Menüpontok
          ...themeMenuData.map((themeData) {
            final KAppThemeType themeType = themeData['type'] as KAppThemeType;
            final String themeName = themeData['name'] as String;

            final isSelected = currentTheme == themeType;

            return ListTile(
              title: Text(
                themeName,
                style: textTheme.bodySmall?.copyWith(
                  color: isSelected ? kPrimaryColor : colorScheme.onBackground,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.check, size: 18, color: kPrimaryColor)
                  : null,
              onTap: () {
                themeProvider.setTheme(themeType);
                // Bezárjuk a Drawert a választás után
                Navigator.pop(context);
              },
            );
          }).toList(),
          const Divider(),

          // Kapcsolat gomb
          ListTile(
            title: Text(
              'Contact Us',
              style: textTheme.bodyMedium?.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Kapcsolat oldalra navigálás
            },
          ),
        ],
      ),
    );
  }
}