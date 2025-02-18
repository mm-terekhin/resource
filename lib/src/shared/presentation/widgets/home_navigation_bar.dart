import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final router = GoRouter.of(context);

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: theme.spacings.x2,
              horizontal: theme.spacings.x4,
            ),
            decoration: BoxDecoration(
              color: theme.palette.bgSecondary.withValues(
                alpha:
                0.13,
              ),
              borderRadius: BorderRadius.all(
                theme.radii.x10,
              ),
              boxShadow: [
                theme.shadows.small,
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Цели
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.flag,
                  ),
                  style: ButtonStyle(
                    iconColor: WidgetStateProperty.resolveWith(
                      (state) {
                        if (state.contains(WidgetState.pressed)) {
                          return theme.palette.bgPrimary;
                        }

                        return location == '/goals'
                            ? theme.palette.iconAccentFirst
                            : theme.palette.iconPrimary;
                      },
                    ),
                  ),
                  onPressed: () {
                    if (location != '/goals') {
                      router.go('/goals');
                    }
                  },
                ),
                //Календарь и соответсвующие выбранной дате события
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.calendarDays,
                  ),
                  style: ButtonStyle(
                    iconColor: WidgetStateProperty.resolveWith(
                      (state) {
                        if (state.contains(WidgetState.pressed)) {
                          return theme.palette.bgPrimary;
                        }

                        return location == '/'
                            ? theme.palette.iconAccentFirst
                            : theme.palette.iconPrimary;
                      },
                    ),
                  ),
                  onPressed: () {
                    if (location != '/') {
                      router.go('/');
                    }
                  },
                ),
                //Финансы
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.coins,
                  ),
                  style: ButtonStyle(
                    iconColor: WidgetStateProperty.resolveWith(
                      (state) {
                        if (state.contains(WidgetState.pressed)) {
                          return theme.palette.bgPrimary;
                        }

                        return location == '/finance'
                            ? theme.palette.iconAccentFirst
                            : theme.palette.iconPrimary;
                      },
                    ),
                  ),
                  onPressed: () {
                    if (location != '/finance') {
                      router.go('/finance');
                    }
                  },
                ),
                //Профиль
                IconButton(
                  style: ButtonStyle(
                    iconColor: WidgetStateProperty.resolveWith(
                      (state) {
                        if (state.contains(WidgetState.pressed)) {
                          return theme.palette.bgPrimary;
                        }

                        return location == '/user_settings'
                            ? theme.palette.iconAccentFirst
                            : theme.palette.iconPrimary;
                      },
                    ),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.circleUser,
                  ),
                  onPressed: () {
                    if (location != '/user_settings') {
                      router.go('/user_settings');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
