import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../../app/i18n/translations.g.dart';
import '../../../../../core/core.dart';

Future<DateTime?> showCustomDatePicker({
  required BuildContext context,
  DateTime? firstDate,
  DateTime? lastDate,
  DateTime? initialDate,
}) async {
  DateTime? selectedDate;

  if (Platform.isAndroid) {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate ?? DateTime.now().dateOnly,
      lastDate: lastDate ??
          DateTime.now().dateOnly.add(
                const Duration(
                  days: 365 * 100,
                ),
              ),
      initialDate: initialDate,
    );

    return selectedDate;
  }

  if (context.mounted) {
    final theme = Theme.of(context);

    await showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: theme.palette.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: theme.radii.x4,
          topRight: theme.radii.x4,
        ),
      ),
      context: context,
      builder: (context) {
        return _CupertinoModalDatePicker(
          onDateTimeChanged: (value) {
            selectedDate = value;
          },
          maximumDate: lastDate ??
              DateTime.now().dateOnly.add(
                    const Duration(
                      days: 365 * 100,
                    ),
                  ),
          minimumDate: firstDate ?? DateTime.now().dateOnly,
          initialDateTime: initialDate,
        );
      },
    );
  }

  return selectedDate;
}

class _CupertinoModalDatePicker extends StatefulWidget {
  const _CupertinoModalDatePicker({
    required this.onDateTimeChanged,
    required this.maximumDate,
    required this.minimumDate,
    required this.initialDateTime,
  });

  final void Function(DateTime? value) onDateTimeChanged;
  final DateTime maximumDate;
  final DateTime minimumDate;
  final DateTime? initialDateTime;

  @override
  State<_CupertinoModalDatePicker> createState() =>
      _CupertinoModalDatePickerState();
}

class _CupertinoModalDatePickerState extends State<_CupertinoModalDatePicker> {
  DateTime? _pickedDate;

  @override
  void initState() {
    _pickedDate = widget.initialDateTime ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(
          theme.spacings.x4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  i18n.datePickerTitle,
                  style: theme.textTheme.titleSmall,
                ),
                InkWell(
                  borderRadius: BorderRadius.all(
                    theme.radii.x10,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: theme.palette.iconPrimary,
                    size: theme.spacings.x6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: theme.spacings.x20 * 2 + theme.spacings.x15,
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {
                  setState(() {
                    _pickedDate = value;
                  });
                },
                maximumDate: widget.maximumDate,
                minimumDate: widget.minimumDate,
                initialDateTime: widget.initialDateTime,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onDateTimeChanged(_pickedDate);

                Navigator.pop(context);
              },
              child: Text(
                i18n.buttonTitle.save,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
