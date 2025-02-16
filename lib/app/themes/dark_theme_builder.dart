import 'package:flutter/material.dart';
import '../app.dart';

const _palette = Palette.dark();
const _fontFamily = 'Rubik';

class DarkThemeBuilder extends ThemeBuilder {
  @override
  ThemeData build({
    Radii radii = const Radii.regular(),
    Spacings spacings = const Spacings.regular(),
    Shadows shadows = const Shadows.regular(),
  }) {
    final textTheme = _defaultTextTheme.apply(
      bodyColor: _palette.textPrimary,
      displayColor: _palette.textPrimary,
    );

    return ThemeData(
      appBarTheme: _appBarThemeBuilder(),
      useMaterial3: true,
      fontFamily: _fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: _palette.bgPrimary,
      extensions: [
        _palette,
        radii,
        spacings,
        shadows,
      ],
    );
  }

  AppBarTheme _appBarThemeBuilder() => AppBarTheme(
        backgroundColor: _palette.bgPrimary,
        titleTextStyle: _defaultTextTheme.titleLarge,
        foregroundColor: _palette.bgSecondary,
      );

  TextTheme get _defaultTextTheme => textThemeBuilder();
}
