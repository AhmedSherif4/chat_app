import 'package:chat/features/home/home.dart';
import 'package:chat/features/login/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../../my_app/splash/splash_screen.dart';
import 'routes_names.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.rSplashScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const SplashScreen();
          },
        );
      case AppRoutesNames.rHomeScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const HomeScreen();
          },
        );
      case AppRoutesNames.rLoginScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const LoginScreen();
          },
        );
      default:
        return unDefinedRoute();
    }
  }
}
