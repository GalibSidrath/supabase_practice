import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_practice/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mcwyannwbchplhyookut.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jd3lhbm53YmNocGxoeW9va3V0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM2MTkxMjEsImV4cCI6MjA0OTE5NTEyMX0.ZTQaRHtinsRwIcVckfQxh-5RLH7ZIOI1Foup19XhrEA',
  );

  runApp(const SupabaseApp());
}
