import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class UploadImage {
  final SupabaseClient _supabase = Supabase.instance.client;
  String? imageUrl;
  late String msg;

  Future<bool> uploadImage(File image) async {
    bool isSuccess = false;
    try {
      //defining file name for image
      final path = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      //uploading to supabase bucket
      final uploadToBucket = await _supabase.storage
          .from('images')
          .upload(path, image, fileOptions: const FileOptions(upsert: true));
      // upload successful then getting image url
      if (uploadToBucket.isNotEmpty) {
        imageUrl = await _supabase.storage.from('images').getPublicUrl(path);
        msg = 'Successfully uploaded';
      } else {
        msg = 'Faild to upload';
      }

      // saving to database
      final saveUrlIntotable =
          await _supabase.from('upload_urls').insert({'url': imageUrl!});
      isSuccess = true;
    } catch (e) {
      msg = 'Something went wrong: ${e.toString()}';
    }
    print(msg);
    return isSuccess;
  }
}
