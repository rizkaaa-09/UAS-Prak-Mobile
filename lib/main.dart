
import 'package:flutter/material.dart';
import 'package:quiz/homepage.dart';
import 'package:quiz/pages/login.dart';
void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Quiz';
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
  }




