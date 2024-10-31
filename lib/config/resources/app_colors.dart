import 'package:chat/my_app/app_settings/app_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppColors {
  static bool isDarkMode(BuildContext context) =>
      context.watch<AppSettingsCubit>().getThemeMode();

  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFF9E9E9E);
  static const Color red = Color(0xFFE57373);
  static const Color blue = Color(0xFF64B5F6);

  ///Light colors Theme
  static Color primaryColor(BuildContext context) =>
      isDarkMode(context) ? const Color(0xFF001F3F) : const Color(0xFFFFEAC5);

  static Color primaryColor2(BuildContext context) =>
      isDarkMode(context) ? const Color(0xFF3A6D8C) : const Color(0xFFFFDBB5);

  static Color primaryColor3(BuildContext context) =>
      isDarkMode(context) ? const Color(0xFF6A9AB0) : const Color(0xFF6C4E31);

  static Color primaryColor4(BuildContext context) =>
      isDarkMode(context) ? const Color(0xFFEAD8B1) : const Color(0xFF603F26);

  static const Color darkColor = Color(0xFF001F3F);
  static const Color darkColor2 = Color(0xFF3A6D8C);
  static const Color darkColor3 = Color(0xFF6A9AB0);
  static const Color darkColor4 = Color(0xFFEAD8B1);

  static const Color lightColor = Color(0xFFFFEAC5);
  static const Color lightColor2 = Color(0xFFFFDBB5);
  static const Color lightColor3 = Color(0xFF6C4E31);
  static const Color lightColor4 = Color(0xFF603F26);

  ///background color
  static Color backgroundColor(BuildContext context) =>
      isDarkMode(context) ? const Color(0xFF001F3F) : const Color(0xFFFFEAC5);

  static Color backgroundLightColor = const Color(0xFFFFEAC5);
  static Color backgroundDarkColor = const Color(0xFF001F3F);

  ///fields color
  static const Color white = Color(0xFFFFFFFF);

  ///text color
  static const Color textColor = Color(0xFF262626);
  static const Color textColor2 = Color(0xFF323131);
  static const Color textColor3 = Color(0xFF515152);
  static const Color textColor4 = Color(0xFF797676);
  static const Color textColor5 = Color(0xFFACACAC);
  static const Color textColor6 = Color(0xFFEEEEEE);

  static Color themeTextColor(context) =>
      isDarkMode(context) ? textColor6 : textColor;

  ///situation color
  static const Color failColor = Color(0xFFB3261E);
  static const Color successColor = Color(0xFF02542D);
  static const Color warningColor = Color(0xFFE8B931);
}

abstract class AppGradientColors {
  // any Gradient Colors
  static const LinearGradient blueGradient2 = LinearGradient(
    begin: Alignment(-0.95, -0.31),
    end: Alignment(0.95, 0.31),
    colors: [
      Color(0xFF1B3D6F),
      Color(0xE51B3D6F),
    ],
  );

  static const LinearGradient skillsGradient = LinearGradient(
    begin: Alignment(-0.95, -0.31),
    end: Alignment(0.95, 0.31),
    colors: [
      Color(0xFFFFD7AB),
      Color(0xFFFAF1E7),
    ],
  );

  static const LinearGradient adviceGradient = LinearGradient(
    colors: [Color(0xFF3DB8EF), Color(0xFFE7E0BE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient pointsGradient = LinearGradient(
    colors: [
      Color(0xFF3E238A),
      Color(0xFF3A2C1D),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient guestDialogGradient = LinearGradient(
    colors: [
      Color(0xFFF9A144),
      Color(0xFFD0781B),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient nafeesGradient = LinearGradient(
    colors: [
      Color(0xFFFF9C4B),
      Color(0xFFF47827),
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}
