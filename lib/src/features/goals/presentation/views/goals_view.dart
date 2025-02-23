import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../../app/i18n/translations.g.dart';
import '../../goals.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n.goals.title,
        ),
      ),
      body: BlocBuilder<GoalsBloc, GoalsState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: theme.spacings.x6,
                horizontal: theme.spacings.x4,
              ),
              itemBuilder: (context, index) {
                final goal = state.goals[index];

                return InkWell(
                  borderRadius: BorderRadius.all(
                    theme.radii.x4,
                  ),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(
                      theme.spacings.x4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.palette.bgSecondary.withValues(
                        alpha: 0.3,
                      ),
                      borderRadius: BorderRadius.all(
                        theme.radii.x4,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    theme.radii.x1,
                                  ),
                                ),
                                side: BorderSide(
                                  color: theme.palette.iconPrimary,
                                ),
                                visualDensity: VisualDensity.comfortable,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                value: goal.isReady,
                                onChanged: (value) {},
                              ),
                            ),
                            SizedBox(
                              width: theme.spacings.x1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: theme.spacings.x1 + 2,
                              ),
                              child: Text(
                                goal.title,
                                style: theme.textTheme.titleMedium,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: goal.subtasks.isNotEmpty
                              ? EdgeInsets.only(
                                  top: theme.spacings.x2,
                                  left: theme.spacings.x4,
                                )
                              : EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final subtask = goal.subtasks[index];

                            return Row(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        theme.radii.x1,
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: theme.palette.iconPrimary,
                                    ),
                                    visualDensity: VisualDensity.comfortable,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: goal.isReady,
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(
                                  width: theme.spacings.x1,
                                ),
                                Text(
                                  subtask.title,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox();
                          },
                          itemCount: goal.subtasks.length > 3
                              ? 3
                              : goal.subtasks.length,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: theme.spacings.x2,
                );
              },
              itemCount: state.goals.length,
            ),
          );
        },
      ),
    );
  }
}
