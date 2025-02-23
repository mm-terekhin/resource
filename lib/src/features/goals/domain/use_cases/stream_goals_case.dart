import '../../../../shared/shared.dart';
import '../../goals.dart';

class StreamGoalsCase implements UseCase<List<Goal>, NoParams> {
  const StreamGoalsCase({
    required GoalsRepository goalsRepository,
  }) : _goalsRepository = goalsRepository;

  final GoalsRepository _goalsRepository;

  @override
  Stream<List<Goal>> call(NoParams params) => _goalsRepository.goalsStream;
}
