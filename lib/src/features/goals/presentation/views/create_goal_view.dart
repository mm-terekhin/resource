import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../app/app.dart';
import '../../../../../app/i18n/translations.g.dart';
import '../../../../../core/extensions/date_time_extension.dart';
import '../../../../shared/shared.dart';
import '../../goals.dart';

class CreateGoalView extends StatelessWidget {
  const CreateGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<CreateGoalBloc, CreateGoalState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: theme.palette.buttonPrimary.withOpacity(
                state.goal.isValid ? 1 : 0.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  theme.radii.x10,
                ),
              ),
              onPressed: state.goal.isValid
                  ? () {
                      context.read<CreateGoalBloc>().add(
                            const SaveCreateGoalEvent(),
                          );
                    }
                  : null,
              label: Text(
                i18n.buttonTitle.save,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.palette.textPrimary.withOpacity(
                    state.goal.isValid ? 1 : 0.2,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(
                  theme.spacings.x4,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  TextField(
                    style: theme.textTheme.titleMedium,
                    maxLines: null,
                    maxLength: 1000,
                    onChanged: (value) {
                      final newGoal = state.goal.copyWith(
                        title: value,
                      );

                      context.read<CreateGoalBloc>().add(
                            ChangeCreateGoalEvent(
                              goal: newGoal,
                            ),
                          );
                    },
                    decoration: InputDecoration(
                      counter: Container(),
                      hintStyle: theme.textTheme.titleMedium?.copyWith(
                        color: theme.palette.textSecondary,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: i18n.textFieldLabel.title,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: theme.spacings.x6,
                    ),
                    child: TextField(
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: theme.spacings.x5,
                    ),
                    child: ExpandingTextField(
                      hintText: i18n.textFieldLabel.comment,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: theme.spacings.x2,
                  ),
                  Row(
                    children: [
                      Text(
                        i18n.shared.priority,
                      ),
                      SizedBox(
                        width: theme.spacings.x3,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              (state.goal.priority?.toColor() ??
                                      theme.palette.buttonPrimary)
                                  .withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          onPressed: () => _showPriorityModal(
                            context,
                            (value) {
                              final newGoal = state.goal.copyWith(
                                priority: value,
                              );
                              context.read<CreateGoalBloc>().add(
                                    ChangeCreateGoalEvent(
                                      goal: newGoal,
                                    ),
                                  );
                            },
                          ),
                          child: Row(
                            children: [
                              Text(
                                state.goal.priority?.toText() ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        i18n.shared.termUp,
                      ),
                      SizedBox(
                        width: theme.spacings.x3,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              theme.palette.buttonPrimary.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            final selectedDate = await showCustomDatePicker(
                              context: context,
                            );

                            if (context.mounted) {
                              final newGoal = state.goal.copyWith(
                                dateEnd: selectedDate,
                              );

                              context.read<CreateGoalBloc>().add(
                                    ChangeCreateGoalEvent(
                                      goal: newGoal,
                                    ),
                                  );
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                state.goal.dateEnd != null
                                    ? DateFormat(
                                        'dd MMM yyyy',
                                        TranslationProvider.of(context)
                                            .flutterLocale.languageCode,
                                      ).format(state.goal.dateEnd!)
                                    : '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showPriorityModal(
    BuildContext context,
    void Function(Priority value) onChange,
  ) async {
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
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x4,
            vertical: theme.spacings.x6,
          ),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final priority = Priority.values[index];
            return Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    priority.toColor().withOpacity(
                          0.5,
                        ),
                  ),
                ),
                onPressed: () {
                  onChange(priority);
                  Navigator.pop(context);
                },
                child: Text(
                  priority.toText(),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: priority.toColor(),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: theme.spacings.x2,
            );
          },
          itemCount: Priority.values.length,
        );
      },
    );
  }
}
