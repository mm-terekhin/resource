import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    // Text
    required this.textPrimary,
    // Backgrounds
    required this.bgPrimary,
    required this.bgSecondary,
    // Icons
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconAccentFirst,
  });

  const Palette.dark()
      : this(
          // Text
          textPrimary: const Color(0xFFDEDCDC),
          // Backgrounds
          bgPrimary: const Color(0xFF191D23),
          bgSecondary: const Color(0xFFDEDCDC),
          // Icons
          iconPrimary: const Color(0xFFDEDCDC),
          iconSecondary: const Color(0xFF191D23),
          iconAccentFirst: const Color(0xFF57707A),
        );

  // Text
  final Color textPrimary;

  // Backgrounds
  final Color bgPrimary;
  final Color bgSecondary;

  // Icons
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconAccentFirst;

  @override
  Palette copyWith({
    // Text
    Color? textPrimary,
    // Backgrounds
    Color? bgPrimary,
    Color? bgSecondary,
    // Icons
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconAccentFirst,
  }) {
    return Palette(
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      // Backgrounds
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      // Icons
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconAccentFirst: iconAccentFirst ?? this.iconAccentFirst,
    );
  }

  @override
  ThemeExtension<Palette> lerp(ThemeExtension<Palette>? other, double t) {
    if (other is! Palette) {
      return this;
    }

    return Palette(
      // Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      // Backgrounds
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      // Icons
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconAccentFirst: Color.lerp(iconAccentFirst, other.iconAccentFirst, t)!,
    );
  }
}
