import 'package:flutter/material.dart';
import 'package:game_pedia/signin_up/signin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamePedia',
      home: Signin(),
    );
  }
}
