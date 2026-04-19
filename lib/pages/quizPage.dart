import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Quiz - $category")),
      body: Center(
        child: Text("Bienvenue dans le quiz de $category"),
      ),
    );
  }
}