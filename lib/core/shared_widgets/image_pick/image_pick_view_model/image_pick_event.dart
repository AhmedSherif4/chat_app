
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickEvent extends Equatable {
  const ImagePickEvent();

  @override
  List<Object> get props => [];
}

class ImagePickerEvent extends ImagePickEvent {
  final ImageSource source;
  const ImagePickerEvent(this.source);

  @override
  List<Object> get props => [source];
}