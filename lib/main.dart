import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleapi1/screen/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: mainpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


