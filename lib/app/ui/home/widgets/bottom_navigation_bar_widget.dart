import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(List<IconData> iconList, int activeIndex, Function onTap) {
  return AnimatedBottomNavigationBar(
    icons: iconList,
    activeIndex: activeIndex,
    gapLocation: GapLocation.center,
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    onTap: onTap,
  );
}