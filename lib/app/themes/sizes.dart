import 'dart:ui';

import 'package:flutter/material.dart';

class Sizes extends ThemeExtension<Sizes> {
  const Sizes({
    required this.iconSizes,
    required this.cardSizes,
    required this.appBarHeight,
    required this.navBarHeight,
    required this.iconButton,
  });

  const Sizes.regular()
      : this(
          iconSizes: const SizeSet(
            tiny: 9,
            small: 16,
            medium: 24,
            large: 32,
          ),
          cardSizes: const SizeSet(
            tiny: 100,
            small: 116,
            medium: 150,
            large: 200,
          ),
          appBarHeight: 66,
          navBarHeight: 86,
          iconButton: 48,
        );

  final SizeSet iconSizes;
  final SizeSet cardSizes;
  final double appBarHeight;
  final double navBarHeight;
  final double iconButton;

  @override
  Sizes copyWith({
    SizeSet? iconSizes,
    SizeSet? cardSizes,
    double? appBarHeight,
    double? navBarHeight,
    double? iconButton,
  }) {
    return Sizes(
      iconSizes: iconSizes ?? this.iconSizes,
      cardSizes: cardSizes ?? this.cardSizes,
      appBarHeight: appBarHeight ?? this.appBarHeight,
      navBarHeight: navBarHeight ?? this.navBarHeight,
      iconButton: iconButton ?? this.iconButton,
    );
  }

  @override
  ThemeExtension<Sizes> lerp(ThemeExtension<Sizes>? other, double t) {
    if (other is! Sizes) {
      return this;
    }

    return Sizes(
      iconSizes: iconSizes.lerp(other.iconSizes, t),
      cardSizes: cardSizes.lerp(other.cardSizes, t),
      appBarHeight: lerpDouble(appBarHeight, other.appBarHeight, t)!,
      navBarHeight: lerpDouble(navBarHeight, other.navBarHeight, t)!,
      iconButton: lerpDouble(iconButton, other.iconButton, t)!,
    );
  }
}

class SizeSet {
  const SizeSet({
    required this.tiny,
    required this.small,
    required this.medium,
    required this.large,
  });

  final double tiny;
  final double small;
  final double medium;
  final double large;

  SizeSet copyWith({
    double? tiny,
    double? small,
    double? medium,
    double? large,
  }) {
    return SizeSet(
      tiny: tiny ?? this.tiny,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  SizeSet lerp(SizeSet other, double t) {
    return SizeSet(
      tiny: lerpDouble(tiny, other.tiny, t)!,
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
    );
  }
}
