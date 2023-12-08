import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraService {
  Future<File> addImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    File? image;
    final pickedFile = await picker.pickImage(source: imageSource);

    image = File(pickedFile!.path);
    return image;
  }
}
