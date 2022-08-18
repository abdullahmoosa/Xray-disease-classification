import 'package:flutter/material.dart';

import './tflite_model.dart';

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
      theme: ThemeData.dark(),
      home: TfliteModel(),
      debugShowCheckedModeBanner: false,
    );
  }
}
