import '../../../../app/i18n/translations.g.dart';

enum TodoCategory {
  tasks,
  goals,
  ideas;

  bool get isTasks => this == tasks;

  bool get isGoals => this == goals;

  bool get isIdeas => this == ideas;

  String toText() {
    switch (this) {
      case TodoCategory.tasks:
        return i18n.todo.tasksTitle;
      case TodoCategory.goals:
        return i18n.todo.goalsTitle;
      case TodoCategory.ideas:
        return i18n.todo.ideasTitle;
    }
  }
}
