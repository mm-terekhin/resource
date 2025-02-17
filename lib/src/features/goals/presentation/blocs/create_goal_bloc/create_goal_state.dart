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
