part of 'goals_bloc.dart';

sealed class GoalsEvent extends Equatable {
  const GoalsEvent();

  @override
  List<Object?> get props => [];
}

class InitGoalsEvent extends GoalsEvent {
  const InitGoalsEvent();
}

class ChangeGoalsEvent extends GoalsEvent {
  const ChangeGoalsEvent({
    required this.value,
  });

  final List<Goal> value;

  @override
  List<Object?> get props => [
        value,
      ];
}
