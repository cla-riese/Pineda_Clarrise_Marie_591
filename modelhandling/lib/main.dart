
import 'package:flutter/material.dart';
import 'package:modelhandling/screen/chat_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://gharrxtqzpupruncqgft.supabase.co",
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdoYXJyeHRxenB1cHJ1bmNxZ2Z0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzExNjY3MjYsImV4cCI6MjA4Njc0MjcyNn0.XcDylFPJHO2ZpcIdlZTjNa2InCJzvplN-1gPvkvZy4I",
  );

  runApp(const MyApp());
}
 

class MyApp extends StatelessWidget {

  const MyApp({super.key});

      

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Student Info Manager',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

        useMaterial3: true,

      ),

      home: const ChatPage(username: 'Cla'),

    );

  }

}
