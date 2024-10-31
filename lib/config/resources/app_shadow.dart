import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppShadow {
  static const BoxShadow outerShadow = BoxShadow(
    color: Colors.grey,
    offset: Offset(4.0, 4.0),
    blurRadius: 8.0,
    spreadRadius: 1.0,
  );

  static BoxShadow appBoxShadow() =>
      BoxShadow(
        color: AppColors.black.withOpacity(0.08),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 2), // changes position of shadow
      );

  static BoxShadow filledBoxShadow() =>
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: 33,
        color: AppColors.textColor4.withOpacity(.84),
      );
}
