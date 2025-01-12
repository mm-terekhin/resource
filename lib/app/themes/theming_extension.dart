import 'package:flutter/material.dart';

import '../app.dart';

extension ThemingExtension on ThemeData {
  Palette get palette => extension<Palette>()!;
  Radii get radii => extension<Radii>()!;
  Spacings get spacings => extension<Spacings>()!;
  Sizes get sizes => extension<Sizes>()!;
  Shadows get shadows => extension<Shadows>()!;
}
