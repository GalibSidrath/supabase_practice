import 'package:flutter/material.dart';
import 'package:supabase_practice/screens/login_screen.dart';
import 'package:supabase_practice/screens/upload_image_screen.dart';
import 'package:supabase_practice/screens/view_images_screen.dart';
import 'package:supabase_practice/services/auth_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authServices.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              icon: const Icon(Icons.login_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              authServices.getUserEmail() ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadImageScreen()));
                  },
                  child: Text('Upload Image')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ViewImageScreen()));
                  },
                  child: Text('View Images')),
            ],
          )
        ],
      ),
    );
  }
}
