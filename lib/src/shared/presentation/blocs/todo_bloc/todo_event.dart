part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class ChangeCategoryTodoEvent extends TodoEvent {
  const ChangeCategoryTodoEvent({
    required this.category,
  });

  final TodoCategory category;

  @override
  List<Object> get props => [];
}
