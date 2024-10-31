import 'package:chat/my_app/app_reference.dart';
import 'package:flutter/material.dart';

import 'custom_painter_widgets.dart';

class BodyOfHome extends StatelessWidget {
  final List<Widget> children;

  const BodyOfHome({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CustomPaint(
            size:
                Size(double.infinity, AppReference.deviceHeight(context) * 0.3),
            painter: BottomOutwardCurvePainter(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            size:
                Size(double.infinity, AppReference.deviceHeight(context) * 0.3),
            painter: TopInwardCurvePainter(),
            willChange: true,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ),
          ),
        )
      ],
    );
  }
}
