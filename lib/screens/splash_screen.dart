import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_practice/screens/home_screen.dart';
import 'package:supabase_practice/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      bool check = isValid();
      check
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
              return const LoginScreen();
            }));
    });
  }

  bool isValid() {
    final res = _supabase.auth.currentUser;
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome To Supabase!!!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
