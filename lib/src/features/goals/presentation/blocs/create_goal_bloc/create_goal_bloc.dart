import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_goal_event.dart';
part 'create_goal_state.dart';

class CreateGoalBloc extends Bloc<CreateGoalEvent, CreateGoalState> {
  CreateGoalBloc() : super(CreateGoalInitial()) {
    on<CreateGoalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
