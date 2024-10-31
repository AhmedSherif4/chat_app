import 'package:flutter/material.dart';

import '../../../config/resources/app_constants.dart';
import '../../../config/resources/app_text_style.dart';
import '../../../my_app/app_reference.dart';
import 'custom_painter_widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, AppReference.deviceHeight(context) * 0.3),
      painter: TopInwardCurvePainter(),
      child: Container(
        margin: const EdgeInsets.all(AppConstants.appPaddingR20),
        width: double.infinity,
        height: AppReference.deviceHeight(context) * 0.3,
        child: Row(
          children: [
            Text(
              'Ahmed Sherif',
              style: const AppTextStyle().roboto.displayMedium38w4,
            ),
          ],
        ),
      ),
    );
  }
}
