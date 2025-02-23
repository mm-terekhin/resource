import '../../goals.dart';

abstract interface class GoalsRepository {
  Future<List<Goal>> getGoals();

  Future<void> putGoal({
    required Goal goal,
  });

  Stream<List<Goal>> get goalsStream;
}
