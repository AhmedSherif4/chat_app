import 'package:chat/config/resources/app_colors.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/my_app/app_reference.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;

  const AppTextStyle({
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
  });

  static const String playfairDisplay = 'Playfair_Display';
  static const String roboto = 'Roboto';

  TextStyle get displayLarge40w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 40.responsiveFontSize,
      );

  TextStyle get displayMedium38w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 38.responsiveFontSize,
      );

  TextStyle get displaySmall36w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 36.responsiveFontSize,
      );

  TextStyle get headlineLarge34w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 34.responsiveFontSize,
      );

  TextStyle get headlineMedium32w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 32.responsiveFontSize,
      );

  TextStyle get headlineSmall30w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 30.responsiveFontSize,
      );

  TextStyle get titleLarge28w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 28.responsiveFontSize,
      );

  TextStyle get titleMedium26w5 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 26.responsiveFontSize,
      );

  TextStyle get titleSmall24w5 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 24.responsiveFontSize,
      );

  TextStyle get bodyLarge22w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 22.responsiveFontSize,
      );

  TextStyle get bodyMedium20w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 20.responsiveFontSize,
      );

  TextStyle get bodySmall18w4 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w400,
        fontSize: 18.responsiveFontSize,
      );

  TextStyle get labelLarge16w5 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 16.responsiveFontSize,
      );

  TextStyle get labelMedium14w5 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 14.responsiveFontSize,
      );

  TextStyle get labelSmall12w5 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 12.responsiveFontSize,
      );

  TextStyle get errorTextStyle12 => TextStyle(
        color: AppColors.red,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 12.responsiveFontSize,
      );

  TextStyle get hintTextStyle14 => TextStyle(
        color: color,
        fontFamily: roboto,
        fontWeight: FontWeight.w500,
        fontSize: 14.responsiveFontSize,
      );

  AppTextStyle copyWith({
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return AppTextStyle(
      color: color ?? this.color,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

extension AppStyleFontFamily on AppTextStyle {
  AppTextStyle get roboto => copyWith(fontFamily: AppTextStyle.roboto);

  AppTextStyle get playfairDisplay =>
      copyWith(fontFamily: AppTextStyle.playfairDisplay);
}

extension AppStyleColor on AppTextStyle {
  AppTextStyle get textColor => copyWith(color: AppColors.textColor);

  AppTextStyle get textColor2 => copyWith(color: AppColors.textColor2);

  AppTextStyle get textColor3 => copyWith(color: AppColors.textColor3);

  AppTextStyle get textColor4 => copyWith(color: AppColors.textColor4);

  AppTextStyle get textColor5 => copyWith(color: AppColors.textColor5);

  AppTextStyle get textColor6 => copyWith(color: AppColors.textColor6);

  AppTextStyle get black => copyWith(color: AppColors.textColor);

  AppTextStyle get white => copyWith(color: AppColors.textColor6);

  AppTextStyle get blue => copyWith(color: AppColors.blue);

  AppTextStyle get gray => copyWith(color: AppColors.gray);

  AppTextStyle get failColor => copyWith(color: AppColors.failColor);

  AppTextStyle get successColor => copyWith(color: AppColors.successColor);

  AppTextStyle get warningColor => copyWith(color: AppColors.warningColor);
}

extension AppStyleFontWeight on AppTextStyle {
  AppTextStyle get w100 => copyWith(fontWeight: AppFontWeight.extraLightW100);

  AppTextStyle get w200 => copyWith(fontWeight: AppFontWeight.mediumLightW200);

  AppTextStyle get w300 => copyWith(fontWeight: AppFontWeight.lightW300);

  AppTextStyle get w400 => copyWith(fontWeight: AppFontWeight.regularW400);

  AppTextStyle get w500 => copyWith(fontWeight: AppFontWeight.regular2W500);

  AppTextStyle get w600 => copyWith(fontWeight: AppFontWeight.semiBoldW600);

  AppTextStyle get w700 => copyWith(fontWeight: AppFontWeight.boldW700);

  AppTextStyle get w800 => copyWith(fontWeight: AppFontWeight.extraBoldW800);
}

extension AppStyleFontStyle on AppTextStyle {
  TextStyle displayLarge40w4Extension(context) =>
      AppReference.themeData(context).textTheme.displayLarge!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle displayMedium38w4Extension(context) =>
      AppReference.themeData(context).textTheme.displayMedium!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle displaySmall36w4Extension(context) =>
      AppReference.themeData(context).textTheme.displaySmall!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle headlineLarge34w4Extension(context) =>
      AppReference.themeData(context).textTheme.headlineLarge!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle headlineMedium32w4Extension(context) =>
      AppReference.themeData(context).textTheme.headlineMedium!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle headlineSmall30w4Extension(context) =>
      AppReference.themeData(context).textTheme.headlineSmall!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle titleLarge28w4Extension(context) =>
      AppReference.themeData(context).textTheme.titleLarge!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle titleMedium26w5Extension(context) =>
      AppReference.themeData(context).textTheme.titleMedium!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle titleSmall24w5Extension(context) =>
      AppReference.themeData(context).textTheme.titleSmall!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle bodyLarge22w4Extension(context) =>
      AppReference.themeData(context).textTheme.bodyLarge!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle bodyMedium20w4Extension(context) =>
      AppReference.themeData(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle bodySmall18w4Extension(context) =>
      AppReference.themeData(context).textTheme.bodySmall!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle labelLarge16w5Extension(context) =>
      AppReference.themeData(context).textTheme.labelLarge!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle labelMedium14w5Extension(context) =>
      AppReference.themeData(context).textTheme.labelMedium!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );

  TextStyle labelSmall12w5Extension(context) =>
      AppReference.themeData(context).textTheme.labelSmall!.copyWith(
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize?.responsiveFontSize,
          );
}

extension AppStyleFontSize on AppTextStyle {
  AppTextStyle customFontSize(double fontSize) =>
      copyWith(fontSize: fontSize.responsiveFontSize);

  AppTextStyle get s5 => copyWith(fontSize: AppFontSize.sp5.responsiveFontSize);

  AppTextStyle get s6 => copyWith(fontSize: AppFontSize.sp6.responsiveFontSize);

  AppTextStyle get s7 => copyWith(fontSize: AppFontSize.sp7.responsiveFontSize);

  AppTextStyle get s8 => copyWith(fontSize: AppFontSize.sp8.responsiveFontSize);

  AppTextStyle get s9 => copyWith(fontSize: AppFontSize.sp9.responsiveFontSize);

  AppTextStyle get s10 =>
      copyWith(fontSize: AppFontSize.sp10.responsiveFontSize);

  AppTextStyle get s11 =>
      copyWith(fontSize: AppFontSize.sp11.responsiveFontSize);

  AppTextStyle get s12 =>
      copyWith(fontSize: AppFontSize.sp12.responsiveFontSize);

  AppTextStyle get s13 =>
      copyWith(fontSize: AppFontSize.sp13.responsiveFontSize);

  AppTextStyle get s14 =>
      copyWith(fontSize: AppFontSize.sp14.responsiveFontSize);

  AppTextStyle get s15 =>
      copyWith(fontSize: AppFontSize.sp15.responsiveFontSize);

  AppTextStyle get s16 =>
      copyWith(fontSize: AppFontSize.sp16.responsiveFontSize);

  AppTextStyle get s17 =>
      copyWith(fontSize: AppFontSize.sp17.responsiveFontSize);

  AppTextStyle get s18 =>
      copyWith(fontSize: AppFontSize.sp18.responsiveFontSize);

  AppTextStyle get s19 =>
      copyWith(fontSize: AppFontSize.sp19.responsiveFontSize);

  AppTextStyle get s20 =>
      copyWith(fontSize: AppFontSize.sp20.responsiveFontSize);

  AppTextStyle get s21 =>
      copyWith(fontSize: AppFontSize.sp21.responsiveFontSize);

  AppTextStyle get s22 =>
      copyWith(fontSize: AppFontSize.sp22.responsiveFontSize);

  AppTextStyle get s23 =>
      copyWith(fontSize: AppFontSize.sp23.responsiveFontSize);

  AppTextStyle get s24 =>
      copyWith(fontSize: AppFontSize.sp24.responsiveFontSize);

  AppTextStyle get s25 =>
      copyWith(fontSize: AppFontSize.sp25.responsiveFontSize);

  AppTextStyle get s26 =>
      copyWith(fontSize: AppFontSize.sp26.responsiveFontSize);

  AppTextStyle get s27 =>
      copyWith(fontSize: AppFontSize.sp27.responsiveFontSize);

  AppTextStyle get s28 =>
      copyWith(fontSize: AppFontSize.sp28.responsiveFontSize);

  AppTextStyle get s29 =>
      copyWith(fontSize: AppFontSize.sp29.responsiveFontSize);

  AppTextStyle get s30 =>
      copyWith(fontSize: AppFontSize.sp30.responsiveFontSize);

  AppTextStyle get s31 =>
      copyWith(fontSize: AppFontSize.sp31.responsiveFontSize);

  AppTextStyle get s32 =>
      copyWith(fontSize: AppFontSize.sp32.responsiveFontSize);

  AppTextStyle get s33 =>
      copyWith(fontSize: AppFontSize.sp33.responsiveFontSize);

  AppTextStyle get s34 =>
      copyWith(fontSize: AppFontSize.sp34.responsiveFontSize);

  AppTextStyle get s35 =>
      copyWith(fontSize: AppFontSize.sp35.responsiveFontSize);

  AppTextStyle get s36 =>
      copyWith(fontSize: AppFontSize.sp36.responsiveFontSize);

  AppTextStyle get s37 =>
      copyWith(fontSize: AppFontSize.sp37.responsiveFontSize);

  AppTextStyle get s38 =>
      copyWith(fontSize: AppFontSize.sp38.responsiveFontSize);

  AppTextStyle get s39 =>
      copyWith(fontSize: AppFontSize.sp39.responsiveFontSize);

  AppTextStyle get s40 =>
      copyWith(fontSize: AppFontSize.sp40.responsiveFontSize);

  AppTextStyle get s41 =>
      copyWith(fontSize: AppFontSize.sp41.responsiveFontSize);

  AppTextStyle get s42 =>
      copyWith(fontSize: AppFontSize.sp42.responsiveFontSize);

  AppTextStyle get s43 =>
      copyWith(fontSize: AppFontSize.sp43.responsiveFontSize);

  AppTextStyle get s44 =>
      copyWith(fontSize: AppFontSize.sp44.responsiveFontSize);

  AppTextStyle get s45 =>
      copyWith(fontSize: AppFontSize.sp45.responsiveFontSize);

  AppTextStyle get s46 =>
      copyWith(fontSize: AppFontSize.sp46.responsiveFontSize);

  AppTextStyle get s47 =>
      copyWith(fontSize: AppFontSize.sp47.responsiveFontSize);

  AppTextStyle get s48 =>
      copyWith(fontSize: AppFontSize.sp48.responsiveFontSize);

  AppTextStyle get s49 =>
      copyWith(fontSize: AppFontSize.sp49.responsiveFontSize);

  AppTextStyle get s50 =>
      copyWith(fontSize: AppFontSize.sp50.responsiveFontSize);
}

abstract class AppFontWeight {
  static const extraLightW100 = FontWeight.w100;
  static const mediumLightW200 = FontWeight.w200;
  static const lightW300 = FontWeight.w300;
  static const regularW400 = FontWeight.w400;
  static const regular2W500 = FontWeight.w500;
  static const semiBoldW600 = FontWeight.w600;
  static const boldW700 = FontWeight.w700;
  static const extraBoldW800 = FontWeight.w800;
}

abstract class AppFontSize {
  static double sp5 = 5.responsiveFontSize;
  static double sp6 = 6.responsiveFontSize;
  static double sp7 = 7.responsiveFontSize;
  static double sp8 = 8.responsiveFontSize;
  static double sp9 = 9.responsiveFontSize;
  static double sp10 = 10.responsiveFontSize;
  static double sp11 = 11.responsiveFontSize;
  static double sp12 = 12.responsiveFontSize;
  static double sp13 = 13.responsiveFontSize;
  static double sp14 = 14.responsiveFontSize;
  static double sp15 = 15.responsiveFontSize;
  static double sp16 = 16.responsiveFontSize;
  static double sp17 = 17.responsiveFontSize;
  static double sp18 = 18.responsiveFontSize;
  static double sp19 = 19.responsiveFontSize;
  static double sp20 = 20.responsiveFontSize;
  static double sp21 = 21.responsiveFontSize;
  static double sp22 = 22.responsiveFontSize;
  static double sp23 = 23.responsiveFontSize;
  static double sp24 = 24.responsiveFontSize;
  static double sp25 = 25.responsiveFontSize;
  static double sp26 = 26.responsiveFontSize;
  static double sp27 = 27.responsiveFontSize;
  static double sp28 = 28.responsiveFontSize;
  static double sp29 = 29.responsiveFontSize;
  static double sp30 = 30.responsiveFontSize;
  static double sp31 = 31.responsiveFontSize;
  static double sp32 = 32.responsiveFontSize;
  static double sp33 = 33.responsiveFontSize;
  static double sp34 = 34.responsiveFontSize;
  static double sp35 = 35.responsiveFontSize;
  static double sp36 = 36.responsiveFontSize;
  static double sp37 = 37.responsiveFontSize;
  static double sp38 = 38.responsiveFontSize;
  static double sp39 = 39.responsiveFontSize;
  static double sp40 = 40.responsiveFontSize;
  static double sp41 = 41.responsiveFontSize;
  static double sp42 = 42.responsiveFontSize;
  static double sp43 = 43.responsiveFontSize;
  static double sp44 = 44.responsiveFontSize;
  static double sp45 = 45.responsiveFontSize;
  static double sp46 = 46.responsiveFontSize;
  static double sp47 = 47.responsiveFontSize;
  static double sp48 = 48.responsiveFontSize;
  static double sp49 = 49.responsiveFontSize;
  static double sp50 = 50.responsiveFontSize;
}
