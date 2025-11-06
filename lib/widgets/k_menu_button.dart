// KMenuButton.dart fájl
import 'package:flutter/material.dart';

class KMenuButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const KMenuButton({
    required this.text,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Téma színek kinyerése
    final colorScheme = Theme.of(context).colorScheme;
    final onPrimaryColor = colorScheme.onPrimary; // Pl. Fehér szín a zöld Primary háttéren

    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        // Ha ki van választva, teljes fehér, különben átlátszóbb fehér.
        color: isSelected ? onPrimaryColor : onPrimaryColor.withOpacity(0.7),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}