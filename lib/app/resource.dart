import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';

class Resource extends StatelessWidget {
  const Resource({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GetIt.instance<AppRouter>().router,
    );
  }
}
