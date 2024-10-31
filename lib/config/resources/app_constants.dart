import 'package:chat/config/resources/app_shadow.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/enum/enum_generation.dart';
import '../../my_app/app_reference.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

abstract class AppConstants {
  // app constant here
  static const int appLocalDurationInDays = 7;
  static const int appLocalDurationInHours = 1;
  static const int tokenLocalDurationInDays = 365;

  //Button Size
  static const double buttonWidth = 210;
  static const double buttonHeight = 35;
  static const double iconButtonWidth = 40;
  static const double iconButtonHeight = 40;
  static const double iconButtonSizeS20 = 20;

  //App Border Radius
  static const double appBorderRadiusR10 = 10;
  static const double appBorderRadiusR15 = 15;
  static const double appBorderRadiusR20 = 20;
  static const double appBorderRadiusR25 = 25;
  static const double appBorderRadiusR30 = 30;
  static const double appBorderRadiusR35 = 35;
  static const double appBorderRadiusR40 = 40;
  static const double textInputFieldBorderRadiusR35 = 35;
  static const double appBorderSideWidthR1 = 1;

  // App Elevation
  static const double appElevationR8 = 8;

  // Scaffold Padding
  static const double appPaddingR20 = 20;
  static const double appPaddingR10 = 10;

  static const double iconSizeS20 = 20;

  static const double appLogoHeight = 110;
  static const double appLogoWidth = 110;

  static const String primaryColorHexCode = '#1F477A';
  static const Duration durationOfConfetti = Duration(milliseconds: 100);
  static const Duration animationTime = Duration(milliseconds: 700);
  static TextStyle quranStyle =
      const AppTextStyle().s16.w200.roboto.titleMedium26w5;

  static TextDirection arabicDirection(text) =>
      AppReference.detectStringType(text) == StringType.english
          ? TextDirection.ltr
          : TextDirection.rtl;

  static String quranFamily(text) =>
      AppReference.detectStringType(text) == StringType.quranicArabic
          ? AppTextStyle.roboto
          : AppTextStyle.playfairDisplay;

  static BoxDecoration containerDecoration({
    Color? backgroundColor,
  }) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.appBorderRadiusR20.responsiveSize,
        ),
        color: backgroundColor ?? AppColors.textColor6,
        boxShadow: [AppShadow.appBoxShadow()],
      );
}
