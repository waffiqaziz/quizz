import 'package:flutter/material.dart';
import 'package:quizz/res/colors.dart';
import 'quiz_page/quiz_page.dart';
import 'res/strings.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.quizz,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: Strings.nunito,
        colorScheme: ColorScheme.fromSeed(
          seedColor: MyColors.colorPrimary,
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
      routes: {
        '/quiz': (context) => const QuizPage(),
      },
    );
  }
}
