import 'package:chat/config/resources/app_animations.dart';
import 'package:chat/config/resources/app_constants.dart';
import 'package:chat/config/resources/app_text_style.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:chat/my_app/app_reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_assets/app_assets.dart';
import '../../../my_app/app_settings/app_settings_cubit.dart';
import 'custom_painter_widgets.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, AppReference.deviceHeight(context) * 0.3),
      painter: BottomOutwardCurvePainter(),
      child: Container(
        margin: const EdgeInsets.all(AppConstants.appPaddingR20),
        width: double.infinity,
        height: AppReference.deviceHeight(context) * 0.3,
        child: Row(
          children: [
            BlocBuilder<AppSettingsCubit, AppSettingsState>(
                builder: (context, state) {
              final AppSettingsCubit cubit =
                  BlocProvider.of<AppSettingsCubit>(context);
              return Wrap(
                children: [
                  SizedBox(
                    height: 50.responsiveHeight,
                    width: 50.responsiveWidth,
                    child: Switch.adaptive(
                      value: cubit.getThemeMode(),
                      onChanged: (isDark) {
                        cubit.setThemeMode(isDark);
                      },
                    ),
                  ),
                  // Text(
                  //   AppStrings.downloadedSuccessfully.tr(),
                  //   style: const AppTextStyle().bodyMedium20w4,
                  // ),
                ],
              );
            }),
            const Spacer(),
            Text(
              'Ahmed Sherif',
              style: AppReference.deviceIsWeb
                  ? const AppTextStyle().playfairDisplay.bodyMedium20w4
                  : const AppTextStyle().playfairDisplay.labelMedium14w5,
            ).animateShimmer(),
            SvgPicture.asset(
              Assets.imagesLogo,
              width: 50.responsiveWidth,
              height: 50.responsiveHeight,
            ).animateScaleNFadeVertical(),
          ],
        ),
      ),
    );
  }
}
