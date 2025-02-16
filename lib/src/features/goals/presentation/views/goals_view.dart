import 'package:flutter/material.dart';

import '../../../../../app/i18n/translations.g.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n.goals.title,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
