import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../../app/initialization/global_bloc_injector.dart';
import '../../../domain/domain.dart';
import '../../../shared.dart';

class TodoAppBar extends SliverPersistentHeaderDelegate {
  const TodoAppBar({
    required this.selectedCategory,
  });

  final TodoCategory selectedCategory;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: TodoCategory.values
          .map(
            (el) => OutlinedButton(
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  theme.textTheme.titleSmall,
                ),
                overlayColor: const WidgetStatePropertyAll(
                  Colors.transparent,
                ),
                foregroundColor:
                    WidgetStateProperty.resolveWith<Color>((states) {
                  if (selectedCategory == el ||
                      states.contains(WidgetState.pressed)) {
                    return theme.palette.textPrimary;
                  }

                  return theme.palette.textSecondary;
                }),
                elevation: const WidgetStatePropertyAll(0),
                side: const WidgetStatePropertyAll(
                  BorderSide.none,
                ),
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide.none,
                  ),
                ),
              ),
              onPressed: () {
                context.read<TodoBloc>().add(
                      ChangeCategoryTodoEvent(
                        category: el,
                      ),
                    );
              },
              child: Text(
                el.toText(),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
