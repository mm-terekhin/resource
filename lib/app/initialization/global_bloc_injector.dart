import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocInjector extends StatelessWidget {
  const GlobalBlocInjector({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return /*MultiBlocProvider(
      providers: [],
      child:*/ child/*,
    )*/;
  }
}
