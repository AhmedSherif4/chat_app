import 'package:equatable/equatable.dart';

import '../../../../../core/enum/enum_generation.dart';

class ImagePickState extends Equatable {


  final PickImageState pickImageState;
  final String pickImageErrorMessage;
  final String imagePath;

  const ImagePickState( {
    this.pickImageState = PickImageState.init,
    this.pickImageErrorMessage = '',
    this.imagePath='',
  });

  ImagePickState copyWith({
    PickImageState? pickImageState,
    String? pickImageErrorMessage,
    String? imagePath,

  }) {
    return ImagePickState(
      pickImageErrorMessage:
      pickImageErrorMessage ?? this.pickImageErrorMessage,
      pickImageState: pickImageState ?? this.pickImageState,
      imagePath: imagePath??this.imagePath,

    );
  }

  @override
  List<Object> get props => [
    pickImageState,
    pickImageErrorMessage,
    imagePath
  ];
}