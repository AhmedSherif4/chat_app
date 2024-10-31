import 'package:flutter/material.dart';

import '../resources/app_text_style.dart';

class ResponsiveDisplayLargeWidget extends StatelessWidget {
  final String label;

  const ResponsiveDisplayLargeWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const AppTextStyle()
              .displayLarge40w4
              .copyWith(fontFamily: AppTextStyle.playfairDisplay),
        ),
      ),
    );
  }
}
