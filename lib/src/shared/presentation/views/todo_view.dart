import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/app.dart';
import '../../shared.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final device = AppInheritedResponsive.of(context).device;
    final theme = Theme.of(context);

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    device.isTablet ? theme.spacings.x6 : theme.spacings.x4,
              ),
              sliver: SliverPersistentHeader(
                delegate: TodoAppBar(
                  selectedCategory: state.category,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
