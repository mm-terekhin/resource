import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class ExpandingTextField extends StatelessWidget {
  const ExpandingTextField({
    super.key,
    required this.onChanged,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.maxCount,
  });

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final int? maxCount;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(maxHeight: theme.spacings.x20 * 5),
      padding: EdgeInsets.only(
        bottom: theme.spacings.x2,
        right: theme.spacings.x4,
        left: theme.spacings.x4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          theme.radii.x4,
        ),
        color: theme.palette.bgSecondary.withValues(
          alpha:
          0.5,
        ),
      ),
      child: TextField(
        style: textStyle ?? theme.textTheme.bodyLarge,
        maxLines: null,
        maxLength: maxCount ?? 3000,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.palette.textSecondary,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
