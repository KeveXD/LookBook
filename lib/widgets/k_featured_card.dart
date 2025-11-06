// KFeaturedCard.dart fájl
import 'package:flutter/material.dart';

// Téma és Konstans Importok
import '../themes/k_theme.dart';       // KThemeAssets (a kép elérési útjához)
// import '../k_constants.dart';  // Ezt hagyjuk bent, de a hiba miatt ide másoljuk a hiányzó konstansokat.

// HIÁNYZÓ KONSTANS DEFINÍCIÓK BEILLESZTVE A HIBAMENTESSÉG ÉRDEKÉBEN
const String kSubTitleGibberish = 'Quisque lacinia eros at tellus egestas.';
const String kLongGibberish = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere '
    'cubilia curae; Nam vel lacus sit amet libero gravida tristique. '
    'Donec at mi eget ipsum facilisis consequat. ';


class KFeaturedCard extends StatelessWidget {
  const KFeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Theme adatok kinyerése
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // 2. Színek és Stílusok meghatározása
    final primaryColor = colorScheme.primary; // Zöld/Oliva szín
    final onBackgroundColor = colorScheme.onBackground; // Sötét szövegszín

    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Kártya háttere: Fehér (vagy surface szín)
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Felső cím: • UT QUIS
          Text(
            '• UT QUIS',
            style: textTheme.labelMedium?.copyWith(
              color: primaryColor, // Zöld szín
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Alcím: kSubTitleGibberish + Private Tours in Vehicles
          Text.rich(
            TextSpan(
              text: kSubTitleGibberish,
              style: textTheme.headlineSmall?.copyWith( // Nagyobb/kiemelt szövegstílus
                color: onBackgroundColor,
                height: 1.1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Private Tours',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor, // Zöld szín
                  ),
                ),
                TextSpan(text: ' in Vehicles', style: TextStyle(color: onBackgroundColor)),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Leírás: kLongGibberish
          Text(
            kLongGibberish,
            style: textTheme.bodyMedium?.copyWith(
              color: onBackgroundColor.withOpacity(0.7), // Halványabb sötét
              height: 1.5,
            ),
          ),
          const SizedBox(height: 25),

          // Checkbox + Szöveg
          Row(
            children: <Widget>[
              Icon(Icons.check_circle_outline, color: primaryColor, size: 20), // Zöld pipa
              const SizedBox(width: 10),
              Text.rich(
                TextSpan(
                  text: 'Aliquam vel urna et ',
                  style: textTheme.bodyMedium?.copyWith(color: onBackgroundColor),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'viverra ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'est.', style: TextStyle(color: onBackgroundColor)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Alsó vonal
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: onBackgroundColor.withOpacity(0.3), width: 1.0)),
            ),
            child: Text(
              'FACERE POSSUM',
              style: textTheme.labelSmall?.copyWith( // Kisebb betűstílus
                color: onBackgroundColor.withOpacity(0.7),
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}