import 'package:flutter/material.dart';

enum ScreenType {
  mobileScreenType,
  desktopScreenType,
  tableScreenType,
}

const int mobileScreenSize = 500;
const int tabletScreenSize = 1100;
const Orientation orientation = Orientation.portrait;

class CustomResponsive extends StatelessWidget {
  const CustomResponsive({
    super.key,
    required this.mobileScreen,
    required this.tabletScreen,
    //required this.desktopScreen,
  });

  final Widget mobileScreen;
  final Widget tabletScreen;

  //final Widget desktopScreen;

  static ScreenType? screenType;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileScreenSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileScreenSize &&
      MediaQuery.of(context).size.width < tabletScreenSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletScreenSize;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        if (width <= mobileScreenSize && isPortrait(context) ||
            height <= mobileScreenSize && isLandscape(context)) {
          screenType = ScreenType.mobileScreenType;
          return mobileScreen;
        }

        //if (width <= tabletScreenSize) {
        screenType = ScreenType.tableScreenType;
        return tabletScreen;
        //}

        /*screenType = ScreenType.desktopScreenType;
        return desktopScreen;*/
      },
    );
  }
}
