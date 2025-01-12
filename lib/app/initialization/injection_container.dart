Future<void> registerDependencies() async {
  await _registerServices();
  await _registerDataSources();
  await _registerRepositories();
  await _registerUseCases();
  await _registerBlocs();
}

Future<void> _registerServices() async {}

Future<void> _registerDataSources() async {}

Future<void> _registerRepositories() async {}

Future<void> _registerUseCases() async {}

Future<void> _registerBlocs() async {}
