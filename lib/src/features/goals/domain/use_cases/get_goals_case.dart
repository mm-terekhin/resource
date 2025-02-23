import '../../../../shared/shared.dart';
import '../../goals.dart';

class GetGoalsCase implements UseCase<List<Goal>, NoParams> {
  const GetGoalsCase({
    required GoalsRepository goalsRepository,
  }) : _goalsRepository = goalsRepository;

  final GoalsRepository _goalsRepository;

  @override
  Future<List<Goal>> call(NoParams params) async => _goalsRepository.getGoals();
}
