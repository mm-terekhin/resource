import 'package:flutter/material.dart';

import '../../../../app/i18n/translations.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitle(location),
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: child,
    );
  }

  String getTitle(String location) {
    switch (location) {
      case '/':
        return i18n.todo.title;
      case '/finance':
        return i18n.finance.title;
      default:
        return '';
    }
  }
}
