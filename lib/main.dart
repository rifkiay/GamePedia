import 'package:flutter/material.dart';
import 'package:GamePedia/controllers/user_controllers.dart';
import 'package:GamePedia/homepage/appbardll.dart';
import 'package:GamePedia/signin_up/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamePedia',
      home: UserController.user != null ? const AppBarDll() :  const Signin(),
    );
  }
}
