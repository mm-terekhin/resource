import 'package:get_it/get_it.dart';

import '../../src/shared/presentation/blocs/todo_bloc/todo_bloc.dart';
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
  _getIt.registerLazySingleton<AppRouter>(
    AppRouter.new,
  );
}

Future<void> _registerDataSources() async {}

Future<void> _registerRepositories() async {}

Future<void> _registerUseCases() async {}

Future<void> _registerBlocs() async {
  _getIt.registerLazySingleton<TodoBloc>(
    TodoBloc.new,
  );
}
