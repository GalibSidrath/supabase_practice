import 'package:flutter/material.dart';
import 'package:supabase_practice/services/get_images.dart';

class ViewImageScreen extends StatefulWidget {
  const ViewImageScreen({super.key});

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  final GetImages getImages = GetImages();
  @override
  void initState() {
    loadImages();
    super.initState();
  }

  Future<void> loadImages() async {
    await getImages.fetchUrls();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All the Imgaes'),
      ),
      body: ListView.builder(
          itemCount: getImages.imageList.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                getImages.imageList[index],
                height: 200,
                width: double.maxFinite,
              ),
            );
          }),
    );
  }
}
