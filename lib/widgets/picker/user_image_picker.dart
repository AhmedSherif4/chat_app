import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File? pickedImage) imagePickfn;

  const UserImagePicker({required this.imagePickfn});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final _pickedImageFile = await _picker.pickImage(source: source, imageQuality: 50, maxWidth: 150);

    if (_pickedImageFile != null) {
      setState(() {
        _pickedImage = File(_pickedImageFile.path); // خزن الصورة في الفيرابل دا
        
      });
      widget.imagePickfn(_pickedImage);
    } else {
      print('No Image Picked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text(
                  'Add image \n from camera',
                  textAlign: TextAlign.center,
                )),
            TextButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.image_rounded),
                label: const Text(
                  'Add image \n from gallery',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ],
    );
  }
}
