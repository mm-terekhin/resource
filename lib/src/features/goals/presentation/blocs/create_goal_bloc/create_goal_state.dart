part of 'create_goal_bloc.dart';

sealed class CreateGoalState extends Equatable {
  const CreateGoalState({
    required this.goal,
  });

  final Goal goal;

  @override
  List<Object> get props => [
        goal,
      ];
}

final class InitialCreateGoalState extends CreateGoalState {
  InitialCreateGoalState()
      : super(
          goal: Goal.initial(),
        );
}

final class ChangedCreateGoalState extends CreateGoalState {
  const ChangedCreateGoalState({
    required super.goal,
  });
}

final class LoadingCreateGoalState extends CreateGoalState {
  const LoadingCreateGoalState({
    required super.goal,
  });
}

final class SuccessCreateGoalState extends CreateGoalState {
  const SuccessCreateGoalState({
    required super.goal,
  });
}

final class FailureCreateGoalState extends CreateGoalState {
  const FailureCreateGoalState({
    required super.goal,
  });
}
