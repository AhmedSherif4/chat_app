import 'package:chat/config/resources/app_colors.dart';
import 'package:chat/config/resources/app_constants.dart';
import 'package:chat/config/resources/app_text_style.dart';
import 'package:chat/config/responsive/responsive.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

enum AppTheme { light, dark }

class ThemeManager {
  static final Map<AppTheme, ThemeData> appThemeData = {
    AppTheme.light: LightTheme().buildLightTheme(),
    AppTheme.dark: DarkTheme().buildDarkTheme(),
  };

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

// class for sharing themes that duplicate with light and dark mode.
mixin SubThemeData {
  TextButtonThemeData getTextButtonTheme() => TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.responsiveSize)),
          )),
          backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        ),
      );

  SwitchThemeData getSwitchTheme(
    IconData icon,
    Color color,
  ) =>
      SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(AppColors.white),
        thumbIcon:
            WidgetStatePropertyAll(Icon(icon, color: AppColors.darkColor)),
        trackColor: WidgetStatePropertyAll(color),
        overlayColor: const WidgetStatePropertyAll(AppColors.white),
      );

  AppBarTheme getAppBarTheme(Color? colorDependOnTheme) => AppBarTheme(
        backgroundColor: colorDependOnTheme,
      );

  CardTheme getCardTheme(Color? colorDependOnTheme) => CardTheme(
        color: colorDependOnTheme,
        margin: EdgeInsets.all(10.responsiveSize),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.responsiveSize),
          ),
        ),
      );

  ElevatedButtonThemeData getElevatedButtonTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.white),
          fixedSize: WidgetStatePropertyAll(
            Size(
              296.responsiveWidth,
              55.responsiveHeight,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.responsiveSize),
              ),
            ),
          ),
        ),
      );

  TextTheme getTextTheme(Color? colorDependOnTheme) {
    AppTextStyle appTextStyle = AppTextStyle(color: colorDependOnTheme);

    return TextTheme(
      displayLarge: appTextStyle.displayLarge40w4,
      displayMedium: appTextStyle.displayMedium38w4,
      displaySmall: appTextStyle.displaySmall36w4,
      headlineLarge: appTextStyle.headlineLarge34w4,
      headlineMedium: appTextStyle.headlineMedium32w4,
      headlineSmall: appTextStyle.headlineSmall30w4,
      titleLarge: appTextStyle.titleLarge28w4,
      titleMedium: appTextStyle.titleMedium26w5,
      titleSmall: appTextStyle.titleSmall24w5,
      bodyLarge: appTextStyle.bodyLarge22w4,
      bodyMedium: appTextStyle.bodyMedium20w4,
      bodySmall: appTextStyle.bodySmall18w4,
      labelLarge: appTextStyle.labelLarge16w5,
      labelMedium: appTextStyle.labelMedium14w5,
      labelSmall: appTextStyle.labelSmall12w5,
    );
  }

  InputDecorationTheme getInputDecorationTheme(Color? colorDependOnTheme) {
    AppTextStyle appTextStyle = AppTextStyle(color: colorDependOnTheme);
    return InputDecorationTheme(
      // content padding
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveManager.getHorizontalSize(10),
        vertical: 0,
      ),

      // hint style
      // hintStyle: appTextStyle.hintTextStyle14,
      // errorStyle: appTextStyle.errorTextStyle12,

      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        borderSide: const BorderSide(
          color: AppColors.gray,
          width: 1,
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        // borderSide: BorderSide(
        //   color: AppColors.primaryColor(context),
        //   width: 1,
        // ),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        // borderSide: BorderSide(
        //   color: AppColors.primaryColor,
        //   width: 1,
        // ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        // borderSide: BorderSide(
        //   color: AppColors.primaryColor,
        //   width: 1,
        // ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 1,
        ),
      ),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(
            AppConstants.textInputFieldBorderRadiusR35,
          ),
        ),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 1,
        ),
      ),
    );
  }

  MenuStyle getMenuStyle() => MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.gray),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveManager.getSize(
                AppConstants.textInputFieldBorderRadiusR35,
              ),
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(10.0.responsiveSize),
        ),
      );
}

extension AppThemeX on AppTheme {
  bool get isLight => this == AppTheme.light;

  bool get isDark => this == AppTheme.dark;
}

/*
Display
Headline
Title
Label
Body
*/
