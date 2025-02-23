import '../../../features.dart';

abstract interface class LocalGoalsDataSource {
  Future<List<Goal>> putGoal({
    required Goal goal,
  });

  Future<List<Goal>> getGoals();
}
