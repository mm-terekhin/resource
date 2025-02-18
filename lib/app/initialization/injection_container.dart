import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../core/core.dart';
import '../../src/features/features.dart';
import '../../src/shared/shared.dart';
import '../app.dart';
import '../app_router.dart';

final _getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _registerServices();
  await _registerDataSources();
  await _registerRepositories();
  await _registerUseCases();
  await _registerBlocs();
}

Future<void> _registerServices() async {
  _getIt
    ..registerLazySingleton<AppRouter>(
      AppRouter.new,
    )
    ..registerLazySingleton<DirectoryService>(
      DirectoryService.new,
    )
    ..registerLazySingleton<FlutterSecureStorage>(
      FlutterSecureStorage.new,
    )
    ..registerLazySingleton<Base64Codec>(
      Base64Codec.new,
    )
    ..registerLazySingleton<Config>(
      ResourceConfig.internal,
    );
}

Future<void> _registerDataSources() async {
  final database = Database(
    directoryService: _getIt(),
    secureStorage: _getIt(),
    base64codec: _getIt(),
    encryptionKey: _getIt<Config>().databaseEncryptionKey ?? '',
  );

  print(_getIt<Config>().databaseEncryptionKey);
}

Future<void> _registerRepositories() async {}

Future<void> _registerUseCases() async {}

Future<void> _registerBlocs() async {
  _getIt.registerFactory<CreateGoalBloc>(
    CreateGoalBloc.new,
  );
}
