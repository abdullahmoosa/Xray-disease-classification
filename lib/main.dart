import 'package:flutter/material.dart';

import './tflite_model.dart';
import './homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Pathologist',
      home: HomePage(),
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFF37474f),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF37474f)),
          accentColor: const Color(0xFF0d47a1)),
      debugShowCheckedModeBanner: false,
    );
  }
}
