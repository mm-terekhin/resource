import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textContrast,
    // Backgrounds
    required this.bgPrimary,
    required this.bgContrast,
  });

  const Palette.light()
      : this(
          // Text
          textPrimary: const Color(0xFF343A40),
          textSecondary: const Color(0xFF707C8C),
          textContrast: const Color(0xFFFFFFFF),
          // Backgrounds
          bgPrimary: const Color(0xFFF4F4F4),
          bgContrast: const Color(0xFFFFFFFF),
        );

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textContrast;

  // Backgrounds
  final Color bgPrimary;
  final Color bgContrast;

  @override
  Palette copyWith({
    // Text
    Color? textPrimary,
    Color? textSecondary,
    Color? textContrast,
    // Backgrounds
    Color? bgPrimary,
    Color? bgContrast,
  }) {
    return Palette(
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textContrast: textContrast ?? this.textContrast,
      // Backgrounds
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgContrast: bgContrast ?? this.bgContrast,
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
      // Backgrounds
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgContrast: Color.lerp(bgContrast, other.bgContrast, t)!,
    );
  }
}
