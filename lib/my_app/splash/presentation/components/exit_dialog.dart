import 'dart:io';

import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/config/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/resources/app_colors.dart';
import '../../../../config/resources/app_text_style.dart';
import '../../../../config/resources/app_values.dart';
import '../../../../config/routes/routes_names.dart';
import '../../../app_reference.dart';
import 'button_widget.dart';

class ExitAndUpdateDialog extends StatelessWidget {
  final String message;
  final Function(bool) confirm;
  final bool withImage;
  final String title;
  final Color titleColor;
  final String? imagePath;
  final bool isUpdateDialog;
  final bool requiredUpdate;
  final bool isSecurityDialog;

  const ExitAndUpdateDialog({
    super.key,
    required this.message,
    required this.confirm,
    this.withImage = true,
    required this.title,
    this.imagePath,
    this.titleColor = AppColors.failColor,
    this.isUpdateDialog = false,
    this.isSecurityDialog = false,
    this.requiredUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      elevation: 5,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      content: Container(
        height: !AppReference.isPortrait(context)
            ? AppReference.deviceHeight(context) * 0.65
            : null,
        width: !AppReference.isPortrait(context)
            ? AppReference.deviceWidth(context) * 0.45
            : AppReference.deviceWidth(context) * 0.8,
        padding: EdgeInsets.all(AppPadding.p20.responsiveSize),
        constraints: BoxConstraints(
          minHeight:
              AppReference.deviceHeight(context) * 0.26.responsiveHeightRatio,
          maxHeight:
              AppReference.deviceHeight(context) * 0.34.responsiveHeightRatio,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.responsiveSize),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppReference.themeData(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(
                    color: titleColor,
                    fontWeight: AppFontWeight.regular2W500,
                  ),
            ),
            const Divider(color: AppColors.textColor6, thickness: 2),
            const Spacer(),
            if (withImage)
              SvgPicture.asset(
                imagePath!,
                height: AppReference.deviceHeight(context) *
                    0.07.responsiveHeightRatio,
              ),
            if (withImage) const Spacer(),
            Text(
              message,
              style: const AppTextStyle().s16.titleLarge28w4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            if (!isUpdateDialog)
              OkOrCancelButton(
                confirm: (confirm),
                isSecurityDialog: isSecurityDialog,
              ),
            if (isUpdateDialog && !requiredUpdate)
              SizedBox(
                width: AppReference.deviceWidth(context) * 0.4,
                child: DefaultButtonWidget(
                  label: 'حسنا',
                  textVerticalPadding:
                      !AppReference.isPortrait(context) ? 6 : 0,
                  onPressed: () {
                    confirm(true);
                  },
                ),
              ),
            if (isUpdateDialog && requiredUpdate)
              Row(
                children: [
                  Expanded(
                    child: DefaultButtonWidget(
                      label: 'حسنا',
                      textVerticalPadding:
                          !AppReference.isPortrait(context) ? 6 : 0,
                      onPressed: () {
                        confirm(true);
                      },
                    ),
                  ),
                  AppSize.s10.sizedBoxWidth,
                  Expanded(
                    child: DefaultButtonWidget(
                      textVerticalPadding:
                          !AppReference.isPortrait(context) ? 6 : 0,
                      label: 'ليس الأن',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class OkOrCancelButton extends StatelessWidget {
  final Function(bool) confirm;
  final bool isSecurityDialog;

  const OkOrCancelButton({
    super.key,
    required this.confirm,
    required this.isSecurityDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButtonWidget(
            textFontSize: AppFontSize.sp10.responsiveFontSize,
            label: isSecurityDialog ? 'التحقق مجددا' : 'حسنا',
            textVerticalPadding: !AppReference.isPortrait(context) ? 6 : 0,
            onPressed: isSecurityDialog
                ? () {
                    RouteManager.rPushNamedAndRemoveUntil(
                        context: context, rName: AppRoutesNames.rSplashScreen);
                  }
                : () {
                    confirm(true);
                    Navigator.pop(context);
                  },
          ),
        ),
        AppSize.s10.sizedBoxWidth,
        Expanded(
          child: DefaultButtonWidget(
            textFontSize: AppFontSize.sp10.responsiveFontSize,
            textVerticalPadding: !AppReference.isPortrait(context) ? 6 : 0,
            label: isSecurityDialog ? 'اغلاق التطبيق' : 'الغاء',
            onPressed: () {
              confirm(false);
              isSecurityDialog ? exit(0) : Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
