import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app.dart';
import '../../shared.dart';

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
    final router = GoRouter.of(context);

    return Scaffold(
      body: child,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: location == '/goals'
          ? FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () => router.pushNamed(
                'create_goal',
              ),
              child: FaIcon(
                FontAwesomeIcons.plus,
              ),
            )
          : null,
      bottomNavigationBar: HomeNavigationBar(
        location: location,
      ),
    );
  }
}
