import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';

import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../../config/resources/app_values.dart';
import '../../my_app/app_reference.dart';
import 'button_widget.dart';

showPermissionsDialog({
  required BuildContext context,
  required String title,
  required String message,
  required void Function() buttonOnPressed1,
  required void Function() buttonOnPressed2,
  required String buttonText1,
  required String buttonText2,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => PermissionsDialog(
      title: title,
      message: message,
      buttonOnPressed1: buttonOnPressed1,
      buttonOnPressed2: buttonOnPressed2,
      buttonText1: buttonText1,
      buttonText2: buttonText2,
    ),
  );
}

class PermissionsDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback buttonOnPressed1;
  final VoidCallback buttonOnPressed2;
  final String buttonText1;
  final String buttonText2;

  const PermissionsDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.buttonOnPressed1,
      required this.buttonOnPressed2,
      required this.buttonText1,
      required this.buttonText2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            AppConstants.appBorderRadiusR20.responsiveSize),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: AppReference.isPortrait(context)
            ? AppReference.deviceHeight(context) * 0.4.responsiveHeightRatio
            : AppReference.deviceHeight(context) * 0.3.responsiveHeightRatio,
        width: AppReference.isPortrait(context)
            ? AppReference.deviceWidth(context) * 0.85
            : AppReference.deviceWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: AppColors.primaryColor(context),
          border: Border.all(
            color: AppColors.primaryColor(context),
            width: 2.responsiveSize,
          ),
          borderRadius: BorderRadius.only(
            topLeft:
                Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
            topRight:
                Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
            bottomLeft:
                Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
          ),
        ),
        child: LayoutBuilder(builder: (context, constrains) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: AppReference.themeData(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor(context),
                    ),
              ),
              Divider(
                color: AppColors.primaryColor2(context),
                thickness: 5.responsiveSize,
                endIndent: 120,
                indent: 100,
              ),
              Padding(
                padding: EdgeInsets.all(5.responsiveSize),
                child: Text(
                  message,
                  style: AppReference.themeData(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor(context)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: constrains.maxHeight * .4,
                child: Row(
                  children: [
                    Expanded(
                      child: DefaultButtonWidget(
                        label: buttonText1,
                        onPressed: buttonOnPressed1,
                        buttonColor: AppColors.primaryColor2(context),
                        height: 20,
                        width: 100,
                      ),
                    ),
                    AppSize.s16.sizedBoxWidth,
                    Expanded(
                      child: DefaultButtonWidget(
                        label: buttonText2,
                        onPressed: buttonOnPressed2,
                        buttonColor: AppColors.primaryColor2(context),
                        height: 20,
                        width: 100,
                      ),
                    ),
                  ],
                ).paddingBody(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
