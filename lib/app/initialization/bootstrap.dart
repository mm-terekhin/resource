import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import '../app.dart';

Future<void> bootstrap(FutureOr<Widget> Function() buiilder) async {
  await runZonedGuarded(
    () async {
      await registerDependencies();
      await GetIt.instance.allReady();

      runApp(await buiilder());
    },
    (error, stackTrace) => Logger().e(
      stackTrace,
      error: error,
    ),
  );
}
