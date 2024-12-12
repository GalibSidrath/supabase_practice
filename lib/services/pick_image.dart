import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path;

class UploadImageController {
  File? finalImage;
  XFile? image;

  ImagePicker picker = ImagePicker();

  Future<void> imagePicker() async {
    image = (await picker.pickImage(source: ImageSource.gallery))!;
    final bytes = await image!.readAsBytes();
    final kb = bytes.length / 1024;
    final mb = kb / 1024;

    if (kDebugMode) {
      print('original image size:' + mb.toString());
    }

    final dir = await path.getTemporaryDirectory();
    final targetPath =
        '${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final compressingImage = await FlutterImageCompress.compressAndGetFile(
        image!.path, targetPath,
        minHeight: 500, minWidth: 500, quality: 80);
    final data = await compressingImage!.readAsBytes();
    final newKb = data.length / 1024;
    final newMb = newKb / 1024;

    if (kDebugMode) {
      print('compress image size:' + newMb.toString());
    }
    finalImage = File(compressingImage.path);
  }
}
