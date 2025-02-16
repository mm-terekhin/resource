class SmallTask {
  const SmallTask({
    required this.title,
    required this.isReady,
  });

  final String title;
  final bool isReady;

  SmallTask copyWith(
    String? title,
    bool? isReady,
  ) =>
      SmallTask(
        title: title ?? this.title,
        isReady: isReady ?? this.isReady,
      );
}
