import 'package:flutter/cupertino.dart';

abstract class RouteManager {
  static Future rPushNamed({
    required BuildContext context,
    required String rName,
    Object? arguments,
  }) =>
      Navigator.pushNamed(
        context,
        rName,
        arguments: arguments,
      );


  static Future rPushReplacementNamed({
    required BuildContext context,
    required String rName,
    Object? arguments,
  }) =>
      Navigator.pushReplacementNamed(
        context,
        rName,
        arguments: arguments,
      );

  static Future rPushNamedAndRemoveUntil({
    required BuildContext context,
    required String rName,
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        rName,
        (route) => false,
        arguments: arguments,
      );




  static rPopRoute(context) => Navigator.pop(context);
}
