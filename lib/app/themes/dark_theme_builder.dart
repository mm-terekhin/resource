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
      iconButtonTheme: _iconButtonThemeBuilder(),
      floatingActionButtonTheme: _floatingActionButtonThemeBuilder(),
      extensions: [
        _palette,
        radii,
        spacings,
        shadows,
      ],
    );
  }

  AppBarTheme _appBarThemeBuilder() => AppBarTheme(
        toolbarHeight: 66,
        backgroundColor: _palette.bgPrimary,
        titleTextStyle: _defaultTextTheme.titleLarge,

        // foregroundColor: _palette.bgSecondary,
      );

  IconButtonThemeData _iconButtonThemeBuilder() => IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            _palette.iconPrimary.withOpacity(0.5),
          ),
          iconSize: const WidgetStatePropertyAll(
            24,
          ),
          iconColor: WidgetStateProperty.resolveWith(
            (state) {
              if (state.contains(WidgetState.pressed)) {
                return _palette.bgPrimary;
              }

              return _palette.iconPrimary;
            },
          ),
        ),
      );

  FloatingActionButtonThemeData _floatingActionButtonThemeBuilder() =>
      FloatingActionButtonThemeData(
        backgroundColor: _palette.buttonPrimary,
        foregroundColor: _palette.textPrimary,
      );

  TextTheme get _defaultTextTheme => textThemeBuilder();
}
