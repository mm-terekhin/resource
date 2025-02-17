part of 'create_goal_bloc.dart';

sealed class CreateGoalEvent extends Equatable {
  const CreateGoalEvent();

  @override
  List<Object?> get props => [];
}

class ChangeCreateGoalEvent extends CreateGoalEvent {
  const ChangeCreateGoalEvent({
    required this.goal,
  });

  final Goal goal;

  @override
  List<Object?> get props => [
        goal,
      ];
}

class SaveCreateGoalEvent extends CreateGoalEvent {
  const SaveCreateGoalEvent();
}
