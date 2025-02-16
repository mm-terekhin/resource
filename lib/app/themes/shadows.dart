import 'package:flutter/material.dart';

class Shadows extends ThemeExtension<Shadows> {
  const Shadows({
    required this.small,
    required this.medium,
    required this.large,
  });

  const Shadows.regular()
      : this(
          small: const BoxShadow(
            color: Color(0x1A747474),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
          medium: const BoxShadow(),
          large: const BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        );

  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  @override
  Shadows copyWith({
    BoxShadow? small,
    BoxShadow? medium,
    BoxShadow? large,
  }) {
    return Shadows(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<Shadows> lerp(ThemeExtension<Shadows>? other, double t) {
    if (other is! Shadows) {
      return this;
    }

    return Shadows(
      small: BoxShadow.lerp(small, other.small, t)!,
      medium: BoxShadow.lerp(medium, other.medium, t)!,
      large: BoxShadow.lerp(large, other.large, t)!,
    );
  }
}
