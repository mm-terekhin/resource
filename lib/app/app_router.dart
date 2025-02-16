import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../src/features/features.dart';
import '../src/shared/shared.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(
            location: state.matchedLocation,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/gaols',
            name: 'gaols',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const GoalsScreen(),
            ),
          ),
          GoRoute(
            path: '/',
            name: 'current_tasks',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const CurrentTasksScreen(),
            ),
          ),
          GoRoute(
            path: '/finance',
            name: 'finance',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const FinanceScreen(),
            ),
          ),
          GoRoute(
            path: '/user_settings',
            name: 'user_settings',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const UserSettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );

  CustomTransitionPage customTransitionPage<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
