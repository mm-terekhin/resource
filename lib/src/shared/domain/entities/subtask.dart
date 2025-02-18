class Subtask {
  const Subtask({
    required this.title,
    required this.isReady,
  });

  Subtask.initial({
    required this.title,
    this.isReady = false,
  });

  final String title;
  final bool isReady;

  Subtask copyWith(
    String? title,
    bool? isReady,
  ) =>
      Subtask(
        title: title ?? this.title,
        isReady: isReady ?? this.isReady,
      );
}
