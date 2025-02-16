import 'package:flutter/material.dart';

import '../app.dart';

extension ThemingExtension on ThemeData {
  Palette get palette => extension<Palette>() ?? const Palette.dark();

  Radii get radii => extension<Radii>() ?? const Radii.regular();

  Spacings get spacings => extension<Spacings>() ?? const Spacings.regular();


  Shadows get shadows => extension<Shadows>() ?? const Shadows.regular();

  List<ThemeExtension<dynamic>> get extensions => [
        palette,
        radii,
        spacings,
        shadows,
      ];
}
