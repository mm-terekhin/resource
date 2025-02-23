import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../goals.dart';

class GoalsRepositoryImpl implements GoalsRepository, Disposable {
  GoalsRepositoryImpl({
    required LocalGoalsDataSource localGoalsDataSource,
  })  : _localGoalsDataSource = localGoalsDataSource,
        _goalsStreamController = StreamController<List<Goal>>.broadcast();

  final LocalGoalsDataSource _localGoalsDataSource;
  late final StreamController<List<Goal>> _goalsStreamController;

  @override
  Future<List<Goal>> getGoals() async {
    final data = await _localGoalsDataSource.getGoals();

    _goalsStreamController.add(data);

    return data;
  }

  @override
  Stream<List<Goal>> get goalsStream => _goalsStreamController.stream;

  @override
  Future<void> putGoal({
    required Goal goal,
  }) async {
    final data = await _localGoalsDataSource.putGoal(
      goal: goal,
    );

    _goalsStreamController.add(data);
  }

  @override
  FutureOr onDispose() async {
    await _goalsStreamController.close();
  }
}
