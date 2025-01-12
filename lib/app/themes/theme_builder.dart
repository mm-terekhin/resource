import 'package:flutter/material.dart';
import '../app.dart';

abstract class ThemeBuilder {
  const ThemeBuilder();

  ThemeData build({
    Radii radii = const Radii.regular(),
    Spacings spacings = const Spacings.regular(),
    Sizes sizes = const Sizes.regular(),
    Shadows shadows = const Shadows.regular(),
  });
}
