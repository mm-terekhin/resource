import 'package:flutter/material.dart';
import '../app.dart';

class LightThemeBuilder extends ThemeBuilder {
  @override
  ThemeData build({
    Radii radii = const Radii.regular(),
    Spacings spacings = const Spacings.regular(),
    Sizes sizes = const Sizes.regular(),
    Shadows shadows = const Shadows.regular(),
  }) {
    const palette = Palette.light();
    const fontFamily = 'Rubik';

    final textTheme = _defaultTextTheme.apply(
      bodyColor: palette.textPrimary,
      displayColor: palette.textPrimary,
    );

    return ThemeData(
      appBarTheme: AppBarTheme(
        color: palette.bgContrast,
      ),
      scaffoldBackgroundColor: palette.bgContrast,
      useMaterial3: true,
      textTheme: textTheme,
      fontFamily: fontFamily,
      extensions: [
        palette,
        radii,
        spacings,
        sizes,
        shadows,
      ],
    );
  }

  TextTheme get _defaultTextTheme => const TextTheme(
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        titleLarge: TextStyle(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          height: 16 / 11,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
        ),
      );
}
