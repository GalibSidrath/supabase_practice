import 'package:supabase_flutter/supabase_flutter.dart';

class GetImages {
  List<String> imageList = [];
  late String msg;
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> fetchUrls() async {
    try {
      final startTime = DateTime.now();
      final response = await _supabase.from('upload_urls').select('url');
      final endTime = DateTime.now();
      print(
          'Time taken to fetch URLs: ${endTime.difference(startTime).inMilliseconds} ms');

      for (var i in response) {
        imageList.add(i['url']);
      }
      msg = "All image fetched";
    } catch (e) {
      msg = "Error fetching urls ${e.toString()}";
    }
    print(msg);
  }
}
