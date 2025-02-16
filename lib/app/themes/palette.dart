import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    // Text
    required this.textPrimary,
    // Backgrounds
    required this.bgPrimary,
    required this.bgSecondary,
  });

  const Palette.dark()
      : this(
          // Text
          textPrimary: const Color(0xFFDEDCDC),
          // Backgrounds
          bgPrimary: const Color(0xFF191D23),
          bgSecondary: const Color(0xFFDEDCDC),
        );

  // Text
  final Color textPrimary;

  // Backgrounds
  final Color bgPrimary;
  final Color bgSecondary;

  @override
  Palette copyWith({
    // Text
    Color? textPrimary,
    // Backgrounds
    Color? bgPrimary,
    Color? bgSecondary,
  }) {
    return Palette(
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      // Backgrounds
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
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
    );
  }
}
