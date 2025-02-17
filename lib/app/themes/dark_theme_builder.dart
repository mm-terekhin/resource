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
      brightness: Brightness.dark,
      appBarTheme: _appBarThemeBuilder(
        textTheme: textTheme,
      ),
      useMaterial3: true,
      fontFamily: _fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: _palette.bgPrimary,
      iconButtonTheme: _iconButtonThemeBuilder(),
      floatingActionButtonTheme: _floatingActionButtonThemeBuilder(),
      datePickerTheme: _datePickerThemeBuilder(
        textTheme: textTheme,
      ),
      elevatedButtonTheme: _elevatedButtonThemeBuilder(
        spacings: spacings,
        textTheme: textTheme,
      ),
      extensions: [
        _palette,
        radii,
        spacings,
        shadows,
      ],
    );
  }

  AppBarTheme _appBarThemeBuilder({
    required TextTheme textTheme,
  }) =>
      AppBarTheme(
        toolbarHeight: 66,
        backgroundColor: _palette.bgPrimary,
        titleTextStyle: textTheme.titleLarge,

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

  DatePickerThemeData _datePickerThemeBuilder({
    required TextTheme textTheme,
  }) =>
      DatePickerThemeData(
        backgroundColor: _palette.bgPrimary,
        dayForegroundColor: WidgetStatePropertyAll(
          _palette.textPrimary,
        ),
        dayBackgroundColor: WidgetStateProperty.resolveWith(
          (state) {
            if (state.contains(
              WidgetState.selected,
            )) {
              return _palette.buttonPrimary;
            }

            return Colors.transparent;
          },
        ),
        todayBackgroundColor: WidgetStateProperty.resolveWith(
          (state) {
            if (state.contains(
              WidgetState.selected,
            )) {
              return _palette.buttonPrimary;
            }

            return Colors.transparent;
          },
        ),
        yearForegroundColor: WidgetStatePropertyAll(
          _palette.iconPrimary,
        ),
        yearStyle: textTheme.bodyLarge,
        yearBackgroundColor: WidgetStateProperty.resolveWith(
          (state) {
            if (state.contains(
              WidgetState.selected,
            )) {
              return _palette.buttonPrimary;
            }

            return Colors.transparent;
          },
        ),
        headerForegroundColor: _palette.textPrimary,
        weekdayStyle: textTheme.bodyLarge,
        dayStyle: textTheme.bodyMedium,
        cancelButtonStyle: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            _palette.buttonPrimary,
          ),
          foregroundColor: WidgetStatePropertyAll(
            _palette.textPrimary,
          ),
        ),
        todayForegroundColor: WidgetStatePropertyAll(
          _palette.iconPrimary,
        ),
        confirmButtonStyle: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            _palette.buttonPrimary,
          ),
          foregroundColor: WidgetStatePropertyAll(
            _palette.textPrimary,
          ),
        ),
        dividerColor: _palette.textPrimary,
      );

  ElevatedButtonThemeData _elevatedButtonThemeBuilder({
    required Spacings spacings,
    required TextTheme textTheme,
  }) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: spacings.x4,
              vertical: spacings.x3,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            _palette.buttonPrimary,
          ),
          foregroundColor: WidgetStatePropertyAll(
            _palette.bgSecondary,
          ),
          textStyle: WidgetStatePropertyAll(
            textTheme.titleSmall,
          ),
        ),
      );

  TextTheme get _defaultTextTheme => textThemeBuilder();
}
