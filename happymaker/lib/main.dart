import 'package:flutter/material.dart';
import 'package:happymaker/constants/constants.dart';
import 'package:happymaker/pages/chat_screen.dart';
import 'package:happymaker/pages/welcomePage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(color: cardColor),

      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}