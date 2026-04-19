import 'package:flutter/material.dart';
import 'pages/accueil.dart';
import 'pages/niveau.dart';
import 'widget/splashPage.dart';
// import 'widget/text.dart';
import 'pages/homePage.dart';
import 'pages/quizPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/accueil',

      routes: {
        // '/': (context) => const SplashPage(),
        // '/text': (context) => const TextW(),
        '/home': (context) => const Homepage(),
        '/accueil': (context) => const Accueil(),
        '/quiz': (context) => const QuizPage(),
        '/niveau': (context) => const Niveau(),
      },
    );
  }
}