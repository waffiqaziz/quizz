import 'package:flutter/material.dart';
import 'package:quizz/data/source.dart';
import 'package:quizz/quiz_page/quiz_page_mobile.dart';
import 'package:quizz/quiz_page/quiz_page_web.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  var quizData = getRandomQuestions();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        if (constraint.maxWidth > 900) {
          return QuizPageWide(questions: quizData); // Show wide layout
        } else {
          return QuizPageMobile(questions: quizData); // Show mobile layout
        }
      },
    );
  }
}
