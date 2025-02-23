import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class Subtask {
  const Subtask({
    required this.title,
    required this.isReady,
  });

  Subtask.initial({
    required this.title,
    this.isReady = false,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) =>
      _$SubtaskFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskToJson(this);

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
