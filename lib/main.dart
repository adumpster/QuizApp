import 'package:flutter/material.dart';
import 'package:quiz_app/pages/homepage.dart';
import 'package:quiz_app/pages/quizpage.dart';
import 'package:quiz_app/pages/resultscreen.dart';
import 'package:quiz_app/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomeScreen(),
        "/quiz": (context) => QuizScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
