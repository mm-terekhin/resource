import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import '../src/shared/shared.dart';
import 'app.dart';
import 'i18n/translations.g.dart';

class Resource extends StatelessWidget {
  const Resource({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocInjector(
      child: CustomResponsive(
        tabletScreen: AppInheritedResponsive(
          device: Device.tablet,
          child: Builder(
            builder: _getApp,
          ),
        ),
        mobileScreen: AppInheritedResponsive(
          device: Device.mobile,
          child: Builder(
            builder: _getApp,
          ),
        ),
      ),
    );
  }

  Widget _getApp(BuildContext context) => MaterialApp.router(
        locale: TranslationProvider.of(context).flutterLocale, // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        routerConfig: GetIt.instance<AppRouter>().router,
        theme: LightThemeBuilder().build(),
      );
}

class AppInheritedResponsive extends InheritedWidget {
  const AppInheritedResponsive({
    required this.device,
    required super.child,
    super.key,
  });

  final Device device;

  static AppInheritedResponsive? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppInheritedResponsive>();

  static AppInheritedResponsive of(BuildContext context) {
    final inheritedResponsive = maybeOf(context);
    if (inheritedResponsive == null) {
      throw FlutterError.fromParts([
        ErrorSummary(
          'No AppInheritedResponsive widget found.',
        ),
        ErrorDescription(
          'No AppInheritedResponsive widget found.',
        ),
      ]);
    }
    return inheritedResponsive;
  }

  @override
  bool updateShouldNotify(covariant AppInheritedResponsive oldWidget) =>
      device != oldWidget.device;
}
