import 'dart:io';

import 'package:chat/core/enum/enum_generation.dart';
import 'package:chat/core/services/services_locator.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/resources/theme_mode/color_control.dart';
import '../core/base_widgets/snackbar_widget.dart';
import '../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';

class AppReference {
  AppReference._();

  static final AppReference _instance = AppReference._();

  static AppReference get instance => _instance;

  static late bool deviceIsAndroid;
  static bool deviceIsTablet = false;
  static bool deviceIsWeb = kIsWeb;
  static late bool deviceIsIos;

  static ThemeData themeData(context) => Theme.of(context);

  static ColorControl colorControl(context) =>
      themeData(context).brightness == Brightness.dark
          ? DarkColorControl()
          : LightColorControl();
  static final deviceInfoPlugin = DeviceInfoPlugin();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static Orientation currentOrientation(context) =>
      MediaQuery.of(context).orientation;

  static bool isPortrait(context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static double deviceHeight(context) => MediaQuery.sizeOf(context).height;

  static double deviceWidth(context) => MediaQuery.sizeOf(context).width;

  static void getDeviceInfo(BuildContext context) {
    final sizeMediaQuery = MediaQuery.sizeOf(context);
    // themeData = Theme.of(context);
    if (!deviceIsWeb) {
      deviceIsAndroid = Platform.isAndroid;
      deviceIsIos = Platform.isIOS;
    }
    final double devicePixelRatio = sizeMediaQuery.shortestSide;
    if (devicePixelRatio < 550) {
      deviceIsTablet = false;
    } else {
      deviceIsTablet = true;
    }
  }

  static Future<String> getMobileID() async {
    if (AppReference.deviceIsIos) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor!;
    } else if (AppReference.deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else {
      return '';
    }
  }

  static Future<String> isPhysicalDevice() async {
    if (AppReference.deviceIsIos) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      if (iosInfo.isPhysicalDevice) {
        return "true";
      } else {
        return "false";
      }
    } else if (AppReference.deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.isPhysicalDevice) {
        print("true emulator");
        return "true";
      } else {
        print("false emulator");
        return "false";
      }
    } else {
      return 'false';
    }
  }

  static Future<bool> isHuaweiDevice() async {
    if (AppReference.deviceIsAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.manufacturer.toLowerCase().contains('huawei')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<bool> isAndroid13AndNewer() async {
    if (deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static bool userIsGuest() {
    if (getIt<UserLocalDataSource>().getUserData() !=
            null /* &&
        getIt<UserLocalDataSource>().getUserData()!.email == 'guest@mail.com'*/
        ) {
      return true;
    } else {
      return false;
    }
  }

  static void guestDialogMustLogin(context) {
    showSnackBarWithAction(
        description: 'يجب تسجيل الدخول أولا',
        state: ToastStates.warning,
        context: context,
        actionIcon: Icons.local_hospital_outlined,
        actionLabel: 'تسجيل',
        onPressed: () {
          // RouteManager.rPushNamedAndRemoveUntil(
          //     context: context, rName: AppRoutesNames.rWelcome);
        });
  }

  static StringType detectStringType(String input) {
    bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(input);
    bool isEnglish = RegExp(r'[A-Za-z]').hasMatch(input);

    if (isArabic && isEnglish) {
      return StringType.unknown;
    } else if (isArabic) {
      if (isQuranicArabic(input)) {
        return StringType.quranicArabic;
      }
      return StringType.arabic;
    } else if (isEnglish) {
      return StringType.english;
    } else {
      return StringType.unknown;
    }
  }

  static bool isQuranicArabic(String input) {
    return RegExp(r'[\u0610-\u061A\u064B-\u065F]').hasMatch(input);
  }
}
