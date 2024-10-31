import 'package:flutter/material.dart';

import '../resources/app_constants.dart';
import 'responsive.dart';

extension PaddingExtension on Widget {
  Widget paddingBody({
    double start = AppConstants.appPaddingR10,
    double top = AppConstants.appPaddingR10,
    double end = AppConstants.appPaddingR10,
    double bottom = AppConstants.appPaddingR10,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        start.responsiveWidth,
        top.responsiveHeight,
        end.responsiveWidth,
        bottom.responsiveHeight,
      ),
      child: this,
    );
  }
}

extension ResponsiveManagerExtensionsDouble on num {
  double get responsiveSize => ResponsiveManager.getSize(toDouble());

  double get responsiveWidth => ResponsiveManager.getHorizontalSize(toDouble());

  double get responsiveHeight => ResponsiveManager.getVerticalSize(toDouble());

  double get responsiveFontSize => ResponsiveManager.getFontSize(toDouble());

  Widget get sizedBoxHeight =>
      SizedBox(height: ResponsiveManager.getVerticalSize(toDouble()));

  Widget get sizedBoxWidth =>
      SizedBox(width: ResponsiveManager.getHorizontalSize(toDouble()));

  double get responsiveHeightRatio =>
      ResponsiveManager.getVerticalSizeRatio(toDouble());
}
