import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final Function() onTap;
  final Widget child;

  const CustomInkWell({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: onTap,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: child,
      );
    });
  }
}
