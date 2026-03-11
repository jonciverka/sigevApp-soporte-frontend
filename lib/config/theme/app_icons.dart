import 'package:flutter/material.dart';

class AppIcons {
  // Icons color
  static const Color iconColor = Colors.black;

  // Icons sizes
  static const double iconSmallSize = 16.0;
  static const double iconMediumSize = 24.0;
  static const double iconLargeSize = 32.0;
  static const double iconXLargeSize = 64.0;

  static const IconData person = Icons.person;
  static const IconData arrowForward = Icons.arrow_forward_rounded;
  static const IconData close = Icons.close;
  static const IconData more = Icons.more_vert_rounded;
  static const IconData error = Icons.error;
  static const IconData warning = Icons.warning;
  static const IconData info = Icons.info;
  static const IconData check = Icons.check_circle_outline_outlined;
  static const IconData galery = Icons.photo_library_sharp;

  // Icons
  static Icon smallIcon(IconData icon, {Color? color}) =>
      Icon(icon, size: iconSmallSize, color: color);
  static Icon mediumIcon(IconData icon, {Color? color}) =>
      Icon(icon, size: iconMediumSize, color: color);
  static Icon largeIcon(IconData icon, {Color? color}) =>
      Icon(icon, size: iconLargeSize, color: color);
  static Icon xLargeIcon(IconData icon, {Color? color}) =>
      Icon(icon, size: iconXLargeSize, color: color);
}
