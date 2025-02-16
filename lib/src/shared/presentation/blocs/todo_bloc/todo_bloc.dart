import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState.initial()) {
    on<ChangeCategoryTodoEvent>(
      _onChangeCategory,
      transformer: droppable(),
    );
  }

  void _onChangeCategory(
    ChangeCategoryTodoEvent event,
    Emitter<TodoState> emit,
  ) {
    emit(
      state.copyWith(
        category: event.category,
      ),
    );
  }
}
