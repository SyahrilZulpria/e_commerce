import 'package:e_commerce/screen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clothes App",
      theme: ThemeData(fontFamily: 'Roboto', primaryColor: Colors.black),
      home: const HomeScreen(),
    );
  }
}
