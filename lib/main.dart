import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QuizRoom.dart';

void main() {
  runApp(const CashQuiz());
}

class CashQuiz extends StatefulWidget {
  const CashQuiz({super.key});

  @override
  State<CashQuiz> createState() => _CashQuizState();
}

class _CashQuizState extends State<CashQuiz> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizRoom(),
      ),
    );
  }
}

