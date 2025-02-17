import 'dart:ui';

import '../../../../app/i18n/translations.g.dart';

enum Priority {
  // Высший
  upper,
  // Высокий
  high,
  // Средний
  medium,
  // Низкий
  low,
  // Минимальный
  minimal;

  String toText() {
    switch (this) {
      case Priority.upper:
        return i18n.priority.title.upper;
      case Priority.high:
        return i18n.priority.title.high;
      case Priority.medium:
        return i18n.priority.title.medium;
      case Priority.low:
        return i18n.priority.title.low;
      case Priority.minimal:
        return i18n.priority.title.minimal;
    }
  }

  String getDescription() {
    switch (this) {
      case Priority.upper:
        return i18n.priority.description.upper;
      case Priority.high:
        return i18n.priority.description.high;
      case Priority.medium:
        return i18n.priority.description.medium;
      case Priority.low:
        return i18n.priority.description.low;
      case Priority.minimal:
        return i18n.priority.description.minimal;
    }
  }

  Color toColor() {
    switch (this) {
      case Priority.upper:
        return const Color(0xFFD32F2F);
      case Priority.high:
        return const Color(0xFFF57C00);
      case Priority.medium:
        return const Color(0xFFFBC02D);
      case Priority.low:
        return const Color(0xFF388E3C);
      case Priority.minimal:
        return const Color(0xFF9E9E9E);
    }
  }
}
