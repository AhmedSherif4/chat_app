import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:chat/config/responsive/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../config/resources/app_strings.dart';
import '../../../../../config/resources/app_values.dart';
import '../../../../../core/base_widgets/snackbar_widget.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../my_app/app_permission.dart';
import '../../../../../my_app/app_reference.dart';
import '../../../../app_assets/app_assets.dart';
import '../../../../config/resources/app_constants.dart';
import '../../../../config/resources/app_text_style.dart';
import '../../custom_inkwell.dart';
import '../../permissions_dialog.dart';
import '../image_pick_view_model/image_pick_bloc.dart';
import '../image_pick_view_model/image_pick_event.dart';
import '../image_pick_view_model/image_pick_state.dart';

class PickImageInkWell extends StatelessWidget {
  const PickImageInkWell({
    super.key,
    required this.pickImageWidget,
    required this.loadingPickImageWidget,
    required this.loadedPickImageWidget,
    required this.errorPickImageWidget,
    required this.permissionDialogMessage,
    required this.pickImageShape,
    required this.onErrorMessage,
    this.imageSourceType,
    required this.onPickFile,
  });

  final Widget pickImageWidget;
  final Widget loadingPickImageWidget;
  final Widget loadedPickImageWidget;
  final Widget errorPickImageWidget;
  final String permissionDialogMessage;
  final PickImageShape pickImageShape;
  final Function(File) onPickFile;
  final Function(String) onErrorMessage;
  final ImageSourceType? imageSourceType;

  Future<void> _pickImageHandler(BuildContext context) async {
    final permissionStatus = await AppPermissions.photosPermissionStatus();
    if (permissionStatus) {
      _pickImageEvent(context);
    } else {
      await _handlePermissionDenied(context);
    }
  }

  Future<void> _handlePermissionDenied(BuildContext context) async {
    final permission = AppPermissions.photosPermission;
    if (await permission.isLimited) {
      _pickImageEvent(context);
    } else if (await permission.isDenied) {
      await _showPermissionDialog(
          context, permissionDialogMessage, _requestPhotosPermission);
    } else if (await permission.isPermanentlyDenied) {
      await _showPermissionDialog(
          context, permissionDialogMessage, _openAppSettings);
    }
  }

  Future<void> _requestPhotosPermission(BuildContext context) async {
    await AppPermissions.photosPermissionRequest();
    if (context.mounted) Navigator.pop(context);
    if (await AppPermissions.photosPermission.isGranted) {
      if (context.mounted) _pickImageEvent(context);
    }
  }

  Future<void> _openAppSettings(BuildContext context) async {
    if (await openAppSettings()) {
      await AppSettings.openAppSettings()
          .then((value) => Navigator.pop(context));
    } else {
      if (context.mounted) {
        Navigator.pop(context);
        showSnackBar(
          description: AppStrings.deviceNotSupported,
          state: ToastStates.info,
          context: context,
        );
      }
    }
  }

  Future<void> _showPermissionDialog(
    BuildContext context,
    String message,
    Future<void> Function(BuildContext) onPressed1,
  ) async {
    if (context.mounted) {
      showPermissionsDialog(
        context: context,
        title: AppStrings.permission,
        message: message,
        buttonText1: AppStrings.alright,
        buttonOnPressed1: () => onPressed1(context),
        buttonText2: AppStrings.notNow,
        buttonOnPressed2: () => Navigator.pop(context),
      );
    }
  }

  _pickImageEvent(context) {
    BlocProvider.of<ImagePickBloc>(context)
        .add(const ImagePickerEvent(ImageSource.gallery));
  }

  Future<void> _cameraHandler(BuildContext context) async {
    final permissionStatus = await AppPermissions.cameraPermissionStatus();
    if (permissionStatus) {
      _cameraEvent(context);
    } else {
      await _handleCameraPermissionDenied(context);
    }
  }

  Future<void> _handleCameraPermissionDenied(BuildContext context) async {
    final permission = AppPermissions.cameraPermission;
    if (await permission.isLimited) {
      _cameraEvent(context);
    } else if (await permission.isDenied) {
      await _showPermissionDialog(context, AppStrings.cameraPermissionMessage,
          _requestCameraPermission);
    } else if (await permission.isPermanentlyDenied) {
      await _showPermissionDialog(
          context, permissionDialogMessage, _openAppSettings);
    }
  }

  Future<void> _requestCameraPermission(BuildContext context) async {
    await AppPermissions.cameraPermissionRequest();
    if (context.mounted) Navigator.pop(context);
    if (await AppPermissions.cameraPermission.isGranted) {
      if (context.mounted) _cameraEvent(context);
    }
  }

  _cameraEvent(context) {
    BlocProvider.of<ImagePickBloc>(context)
        .add(const ImagePickerEvent(ImageSource.camera));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomInkWell(
        onTap: () async {
          await _handlePickImage(context);
        },
        child: BlocBuilder<ImagePickBloc, ImagePickState>(
            builder: (context, state) {
          return _buildPickImageState(context, state);
        }),
      ),
    );
  }

  Future<void> _handlePickImage(BuildContext buildCtx) async {
    switch (pickImageShape) {
      case PickImageShape.bottomSheet:
        await _showBottomSheet(buildCtx);
        break;
      case PickImageShape.item:
        await _handleItemPick(buildCtx);
        break;
      case PickImageShape.dialog:
        await _showDialog(buildCtx);
        break;
    }
  }

  Future<void> _showBottomSheet(BuildContext buildCtx) async {
    showModalBottomSheet(
      context: buildCtx,
      builder: (BuildContext context) {
        return ImagePickerSheet(
          onPickType: (sourceType) async {
            await _handleSourceType(buildCtx, sourceType);
          },
        );
      },
    );
  }

  Future<void> _handleItemPick(BuildContext buildCtx) async {
    if (imageSourceType == ImageSourceType.gallery) {
      await _handleGalleryPick(buildCtx);
    } else {
      await _handleCameraPick(buildCtx);
    }
  }

  Future<void> _showDialog(BuildContext buildCtx) async {
    showDialog(
      context: buildCtx,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ImagePickerSheet(
            onPickType: (sourceType) async {
              await _handleSourceType(buildCtx, sourceType);
            },
          ),
        );
      },
    );
  }

  Future<void> _handleSourceType(
      BuildContext buildCtx, ImageSourceType sourceType) async {
    if (sourceType == ImageSourceType.gallery) {
      await _handleGalleryPick(buildCtx);
    } else {
      await _handleCameraPick(buildCtx);
    }
  }

  Future<void> _handleGalleryPick(BuildContext buildCtx) async {
    if (await AppReference.isAndroid13AndNewer() || AppReference.deviceIsIos) {
      if (buildCtx.mounted) {
        await _pickImageHandler(buildCtx);
      }
    } else {
      if (buildCtx.mounted) {
        _pickImageEvent(buildCtx);
      }
    }
  }

  Future<void> _handleCameraPick(BuildContext buildCtx) async {
    if (buildCtx.mounted) {
      await _cameraHandler(buildCtx);
    }
  }

  Widget _buildPickImageState(BuildContext context, ImagePickState state) {
    switch (state.pickImageState) {
      case PickImageState.init:
        return pickImageWidget;
      case PickImageState.startLoadingImage:
        return loadingPickImageWidget;
      case PickImageState.imagePickedSuccessfully:
        onPickFile(context.read<ImagePickBloc>().imageFile!);
        return loadedPickImageWidget;
      case PickImageState.imagePickedError:
        onErrorMessage(state.pickImageErrorMessage);
        return errorPickImageWidget;
      default:
        return pickImageWidget;
    }
  }
}

class ImagePickerSheet extends StatelessWidget {
  const ImagePickerSheet({super.key, required this.onPickType});

  final Function(ImageSourceType) onPickType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomInkWell(
          onTap: () {
            Navigator.pop(context);
            onPickType(ImageSourceType.gallery);
          },
          child: Row(
            children: [
              const Icon(Icons.photo_library),
              AppSize.s10.sizedBoxWidth,
              const Text(AppStrings.gallery),
            ],
          ),
        ).paddingBody(),
        CustomInkWell(
            onTap: () {
              Navigator.pop(context);
              onPickType(ImageSourceType.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera),
                AppSize.s10.sizedBoxWidth,
                const Text(AppStrings.camera),
              ],
            )).paddingBody(),
      ],
    );
  }
}

class PickImgWidget extends StatelessWidget {
  const PickImgWidget({super.key, required this.pickImageErrorMessage});

  final String pickImageErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ChooseImageTitle(),
        ChooseImageWidget(pickImageErrorMessage: pickImageErrorMessage),
      ],
    );
  }
}

class ChooseImageWidget extends StatelessWidget {
  final String pickImageErrorMessage;

  const ChooseImageWidget({super.key, required this.pickImageErrorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: AppReference.deviceWidth(context) * 0.27,
          height:
              AppReference.deviceHeight(context) * 0.12.responsiveHeightRatio,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            image: DecorationImage(
              image: context.read<ImagePickBloc>().imageFile == null
                  ? const AssetImage(Assets.iconsUpdate)
                  : FileImage(context.read<ImagePickBloc>().imageFile!)
                      as ImageProvider,
            ),
            borderRadius: BorderRadius.circular(
              AppConstants.appBorderRadiusR20.responsiveSize,
            ),
          ),
        ),
        AppSize.s10.sizedBoxHeight,
        Text(
          'Correct Image Format',
          style: AppReference.themeData(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 12.responsiveFontSize),
        ),
        Text(
          pickImageErrorMessage,
          style: AppReference.themeData(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

class ChooseImageTitle extends StatelessWidget {
  const ChooseImageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'choose image',
      style: AppReference.deviceIsTablet
          ? const AppTextStyle().w500.bodyMedium20w4
          : const AppTextStyle().w500.bodyLarge22w4,
    );
  }
}
