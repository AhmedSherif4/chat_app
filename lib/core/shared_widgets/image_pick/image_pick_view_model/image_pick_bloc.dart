import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/resources/app_colors.dart';
import '../../../../../core/enum/enum_generation.dart';
import 'image_pick_event.dart';
import 'image_pick_state.dart';

@injectable
class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(const ImagePickState()) {
    on<ImagePickerEvent>(_getImage);
  }

  File? imageFile;
  CroppedFile? _croppedFile;

  void _getImage(ImagePickerEvent event, Emitter<ImagePickState> emit) async {
    emit(state.copyWith(
      pickImageState: PickImageState.startLoadingImage,
    ));
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: event.source);
    if (pickedFile == null) {
      if (imageFile != null) {
        emit(state.copyWith(
          pickImageState: PickImageState.imagePickedError,
          pickImageErrorMessage: '',
        ));
        return null;
      } else {
        emit(state.copyWith(
          pickImageState: PickImageState.imagePickedError,
          pickImageErrorMessage: 'لم يتم اختيار صورة',
        ));
        return null;
      }
    } else {
      imageFile = File(pickedFile.path);
      final isPngOrJpg = ['png', 'jpg', 'jpeg'].contains(
        imageFile!.path.split('.').last.toLowerCase(),
      );
      if (!isPngOrJpg) {
        emit(state.copyWith(
          pickImageState: PickImageState.imagePickedInValidFormat,
          pickImageErrorMessage: 'صيغة الصوره غير صحيحه',
        ));
        return;
      }
      imageFile = await _cropImage(File(pickedFile.path));

      final fileLength = await imageFile!.length();

      final fileSizeInMegabytes = fileLength / (1024 * 1024);

      if (fileSizeInMegabytes > 1) {
        final originalImage = File(pickedFile.path);
        final resizedImage = await _resizeImage(originalImage, 1);
        await originalImage.writeAsBytes(resizedImage.readAsBytesSync());
        imageFile = originalImage;
      }

      emit(state.copyWith(
        pickImageState: PickImageState.imagePickedSuccessfully,
        pickImageErrorMessage: '',
        imagePath: imageFile!.path,
      ));
    }
  }

  Future<File> _cropImage(File file) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: AppColors.darkColor,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '',
        ),
      ],
    );
    if (croppedFile != null) {
      _croppedFile = croppedFile;
    }
    return File(_croppedFile!.path);
  }

  Future<File> _resizeImage(File file, int maxSizeInMB) async {
    final originalImage = img.decodeImage(await file.readAsBytes());

    final fileSizeInBytes = await file.length();
    final maxSizeInBytes = maxSizeInMB * 1024 * 1024;
    final scaleFactor = (maxSizeInBytes / fileSizeInBytes).clamp(0.0, 1.0);

    final newWidth = (originalImage!.width * scaleFactor).round();
    final newHeight = (originalImage.height * scaleFactor).round();

    final resizedImage = img.copyResize(originalImage,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.linear);

    final resizedFile =
        File(file.path.replaceAll(RegExp(r'\.\w+$'), '_resized.jpg'));
    await resizedFile.writeAsBytes(img.encodeJpg(resizedImage, quality: 85));

    return resizedFile;
  }
}
