import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final _supaBase = Supabase.instance.client;
  String? signInMessage;
  String? signUpMessage;
  //Signup
  Future<bool> signUp({required String email, required String password}) async {
    bool isSuccess = false;
    try {
      final result =
          await _supaBase.auth.signUp(email: email, password: password);
      if (result.user != null) {
        isSuccess = true;
        signUpMessage = 'Account Created Successfully';
      } else {
        signUpMessage = 'Failed to create account';
      }
    } catch (e) {
      signUpMessage = e.toString();
    }
    return isSuccess;
  }

  //SignIn
  Future<bool> signIn({required String email, required String password}) async {
    bool isSuccess = false;
    try {
      final result = await _supaBase.auth
          .signInWithPassword(email: email, password: password);
      if (result.user != null) {
        signInMessage = 'SignIn Successfull';
        isSuccess = true;
      } else {
        signInMessage = 'Something went wrong. Please try again';
      }
    } catch (e) {
      signInMessage = e.toString();
    }
    return isSuccess;
  }

  //Getting the email
  String? getUserEmail() {
    final session = _supaBase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

  //SignOut
  Future<void> signOut() async {
    await _supaBase.auth.signOut();
  }
}
