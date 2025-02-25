import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../src/shared/shared.dart';

class GlobalBlocInjector extends StatelessWidget {
  const GlobalBlocInjector({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<TodoBloc>(),
        ),
      ],
      child: child,
    );
  }
}
