import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_practice/services/pick_image.dart';
import 'package:supabase_practice/services/upload_image.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final UploadImageController uploadImageController = UploadImageController();
  final UploadImage uploadImage = UploadImage();
  File? image;

  Future<void> _pickAndSetImage() async {
    await uploadImageController.imagePicker();
    setState(() {
      image = uploadImageController.finalImage;
    });
  }

  Future<void> _uploadImage() async {
    await uploadImage.uploadImage(image!);
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(uploadImage.msg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Photo Upload'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              SizedBox(
                height: 300, // Optional: constrain the image height
                child: Image.file(
                  image!,
                  fit: BoxFit.contain,
                ),
              )
            else
              const Text('Select an image'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickAndSetImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
