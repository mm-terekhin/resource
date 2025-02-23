import '../../../../shared/shared.dart';
import '../../goals.dart';

class CreateGoalCase implements UseCase<void, Goal> {
  const CreateGoalCase({
    required GoalsRepository goalsRepository,
  }) : _goalsRepository = goalsRepository;

  final GoalsRepository _goalsRepository;

  @override
  Future<void> call(Goal params) async {
    await _goalsRepository.putGoal(
      goal: params,
    );
  }
}
