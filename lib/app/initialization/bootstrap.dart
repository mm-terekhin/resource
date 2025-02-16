import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import '../app.dart';
import '../i18n/translations.g.dart';

Future<void> bootstrap(FutureOr<Widget> Function() buiilder) async {
  await runZonedGuarded(
    () async {
      await registerDependencies();
      await GetIt.instance.allReady();

      WidgetsFlutterBinding.ensureInitialized();
      await LocaleSettings.useDeviceLocale();

      runApp(
        TranslationProvider(
          child: await buiilder(),
        ),
      );
    },
    (error, stackTrace) => Logger().e(
      stackTrace,
      error: error,
    ),
  );
}
