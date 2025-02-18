import 'package:flutter/material.dart';

import '../../../../../app/app.dart';
import '../../../../../app/i18n/translations.g.dart';
import '../../../domain/domain.dart';

class SubtaskFields extends StatefulWidget {
  const SubtaskFields({
    super.key,
    required this.subtasks,
    required this.onChange,
  });

  final List<Subtask> subtasks;
  final void Function(List<Subtask> value) onChange;

  @override
  State<SubtaskFields> createState() => _SubtaskFieldsState();
}

class _SubtaskFieldsState extends State<SubtaskFields> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(
        _listener,
      );
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(
        _listener,
      )
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final value = widget.subtasks[index];

            return TextFormField(
              initialValue: value.title,
              style: theme.textTheme.bodyLarge,
              maxLines: null,
              maxLength: 1000,
              onChanged: (value) {},
              decoration: InputDecoration(
                counter: Container(),
                hintStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.palette.textSecondary,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: i18n.textFieldLabel.smallTaskAdd,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: theme.spacings.x2,
            );
          },
          itemCount: widget.subtasks.length,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: theme.textTheme.bodyLarge,
                maxLines: null,
                maxLength: 1000,
                decoration: InputDecoration(
                  counter: Container(),
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.palette.textSecondary,
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: i18n.textFieldLabel.smallTaskAdd,
                ),
              ),
            ),
            if (_controller.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  left: theme.spacings.x4,
                ),
                child: IconButton(
                  onPressed: () {
                    widget.onChange(
                      [
                        ...widget.subtasks,
                        Subtask.initial(
                          title: _controller.text,
                        ),
                      ],
                    );
                    _controller.clear();
                  },
                  icon: Icon(
                    Icons.check,
                    size: theme.spacings.x5,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _listener() {
    setState(() {});
  }
}
