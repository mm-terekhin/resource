part of 'create_goal_bloc.dart';

sealed class CreateGoalState extends Equatable {
  const CreateGoalState();
}

final class CreateGoalInitial extends CreateGoalState {
  @override
  List<Object> get props => [];
}
