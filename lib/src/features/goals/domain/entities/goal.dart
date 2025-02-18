import '../../../../shared/shared.dart';

class Goal {
  const Goal({
    required this.title,
    required this.description,
    required this.isReady,
    required this.createdDate,
    required this.dateEnd,
    required this.priority,
    required this.subtask,
  });

  Goal.initial()
      : title = '',
        description = null,
        isReady = false,
        createdDate = DateTime.now(),
        dateEnd = null,
        priority = null,
        subtask = [];

  final String title;
  final String? description;
  final bool isReady;
  final DateTime createdDate;
  final DateTime? dateEnd;
  final Priority? priority;
  final List<Subtask> subtask;

  Goal copyWith({
    String? title,
    String? description,
    bool? isReady,
    DateTime? createdDate,
    DateTime? dateEnd,
    Priority? priority,
    List<Subtask>? subtask,
  }) =>
      Goal(
        title: title ?? this.title,
        description: description ?? this.description,
        isReady: isReady ?? this.isReady,
        createdDate: createdDate ?? this.createdDate,
        dateEnd: dateEnd ?? this.dateEnd,
        priority: priority ?? this.priority,
        subtask: subtask ?? this.subtask,
      );

  bool get isValid => title.isNotEmpty;
}
