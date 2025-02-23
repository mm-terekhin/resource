part of 'goals_bloc.dart';

enum GoalsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isSuccess => this == success;

  bool get isFailure => this == failure;
}

class GoalsState extends Equatable {
  const GoalsState({
    required this.status,
    required this.goals,
  });

  const GoalsState.initial()
      : status = GoalsStatus.initial,
        goals = const [];

  final GoalsStatus status;
  final List<Goal> goals;

  GoalsState copyWith({
    GoalsStatus? status,
    List<Goal>? goals,
  }) =>
      GoalsState(
        status: status ?? this.status,
        goals: goals ?? this.goals,
      );

  @override
  List<Object?> get props => [
        status,
        goals,
      ];
}
