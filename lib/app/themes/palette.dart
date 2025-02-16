import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textContrast,
    required this.textLink,
    // Backgrounds
    required this.bgPrimary,
    required this.bgSecondary,
    // Icons
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconAccentFirst,
    // Buttons
    required this.buttonPrimary,
  });

  const Palette.dark()
      : this(
          // Text
          textPrimary: const Color(0xFFDEDCDC),
          textSecondary: const Color(0xFF5A636A),
          textContrast: const Color(0xFF191D23),
          textLink: const Color(0xFF007BFF),
          // Backgrounds
          bgPrimary: const Color(0xFF191D23),
          bgSecondary: const Color(0xFFDEDCDC),
          // Icons
          iconPrimary: const Color(0xFFDEDCDC),
          iconSecondary: const Color(0xFF191D23),
          iconAccentFirst: const Color(0xFF57707A),
          // Button
          buttonPrimary: const Color(0xFF57707A),
        );

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textContrast;
  final Color textLink;

  // Backgrounds
  final Color bgPrimary;
  final Color bgSecondary;

  // Icons
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconAccentFirst;

  // Buttons
  final Color buttonPrimary;

  @override
  Palette copyWith({
    // Text
    Color? textPrimary,
    Color? textSecondary,
    Color? textContrast,
    Color? textLink,
    // Backgrounds
    Color? bgPrimary,
    Color? bgSecondary,
    // Icons
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconAccentFirst,
    // Buttons
    Color? buttonPrimary,
  }) {
    return Palette(
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textContrast: textContrast ?? this.textContrast,
      textLink: textLink ?? this.textLink,
      // Backgrounds
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      // Icons
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconAccentFirst: iconAccentFirst ?? this.iconAccentFirst,
      // Buttons
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
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
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textContrast: Color.lerp(textContrast, other.textContrast, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,

      // Backgrounds
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      // Icons
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconAccentFirst: Color.lerp(iconAccentFirst, other.iconAccentFirst, t)!,
      // Buttons
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
    );
  }
}
