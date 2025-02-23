import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../features.dart';

part 'create_goal_event.dart';

part 'create_goal_state.dart';

class CreateGoalBloc extends Bloc<CreateGoalEvent, CreateGoalState> {
  CreateGoalBloc({
    required CreateGoalCase createGoalCase,
  })  : _createGoalCase = createGoalCase,
        super(InitialCreateGoalState()) {
    on<ChangeCreateGoalEvent>(_onChangeGoal);
    on<SaveCreateGoalEvent>(_onSave);
  }

  final CreateGoalCase _createGoalCase;

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
  ) async {
    if (!state.goal.isValid) {
      return;
    }
    emit(
      LoadingCreateGoalState(
        goal: state.goal,
      ),
    );

    try {
      await _createGoalCase.call(
        state.goal,
      );

      emit(
        SuccessCreateGoalState(
          goal: state.goal,
        ),
      );
    } on Exception {
      emit(
        FailureCreateGoalState(
          goal: state.goal,
        ),
      );
    }
  }
}
