import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../shared/domain/domain.dart';
import '../../../goals.dart';

part 'goals_event.dart';

part 'goals_state.dart';

class GoalsBloc extends Bloc<GoalsEvent, GoalsState> {
  GoalsBloc({
    required GetGoalsCase getGoalsCase,
    required StreamGoalsCase streamGoalsCase,
  })  : _getGoalsCase = getGoalsCase,
        super(
          const GoalsState.initial(),
        ) {
    on<InitGoalsEvent>(_onInit);
    on<ChangeGoalsEvent>(_onChange);
    _goalsSubscription = streamGoalsCase.call(NoParams()).listen((event) {
      add(
        ChangeGoalsEvent(
          value: event,
        ),
      );
    });
  }

  final GetGoalsCase _getGoalsCase;
  late final StreamSubscription<List<Goal>> _goalsSubscription;

  Future<void> _onInit(
    InitGoalsEvent event,
    Emitter<GoalsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: GoalsStatus.loading,
      ),
    );

    try {
      await _getGoalsCase.call(
        NoParams(),
      );

      emit(
        state.copyWith(
          status: GoalsStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: GoalsStatus.failure,
        ),
      );
    }
  }

  void _onChange(
    ChangeGoalsEvent event,
    Emitter<GoalsState> emit,
  ) {
    emit(
      state.copyWith(
        status: GoalsStatus.initial,
      ),
    );

    emit(
      state.copyWith(
        goals: event.value,
        status: GoalsStatus.success,
      ),
    );
  }

  @override
  Future<void> close() {
    _goalsSubscription.cancel();
    return super.close();
  }
}
