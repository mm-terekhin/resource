import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../features.dart';

part 'create_goal_event.dart';

part 'create_goal_state.dart';

class CreateGoalBloc extends Bloc<CreateGoalEvent, CreateGoalState> {
  CreateGoalBloc() : super(InitialCreateGoalState()) {
    on<ChangeCreateGoalEvent>(_onChangeGoal);
    on<SaveCreateGoalEvent>(_onSave);
  }

  void _onChangeGoal(
    ChangeCreateGoalEvent event,
    Emitter<CreateGoalState> emit,
  ) {
    emit(
      ChangedCreateGoalState(
        goal: event.goal,
      ),
    );
  }

  Future<void> _onSave(
    SaveCreateGoalEvent event,
    Emitter<CreateGoalState> emit,
  ) async {}
}
