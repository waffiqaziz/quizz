import 'package:flutter/material.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/data/source.dart';
import 'package:quizz/quiz_page/quiz_page_mobile.dart';
import 'package:quizz/quiz_page/quiz_page_web.dart';
import 'package:quizz/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  List<Quizz> quizData = convertQuestionsToQuizz(getRandomQuestions());

  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<String> _answers = [];
  String? _selectedAnswer;

  void _answerQuestion() {
    setState(() {
      _answers.add(_selectedAnswer!);
      if (_selectedAnswer == quizData[_currentQuestionIndex].answer) {
        _score++;
      }
      _selectedAnswer = null; // Reset selected answer for the next question

      if (_currentQuestionIndex < quizData.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Navigate to the result page after the last question
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
                score: _score, answers: _answers, questions: quizData),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        if (constraint.maxWidth > 900) {
          return QuizPageWide(
            questions: quizData,
            currentQuestionIndex: _currentQuestionIndex,
            score: _score,
            selectedAnswer: _selectedAnswer,
            onOptionSelected: (String answer) {
              setState(() {
                _selectedAnswer = answer;
              });
            },
            onNextQuestion: _answerQuestion,
          );
        } else {
          return QuizPageMobile(
            questions: quizData,
            currentQuestionIndex: _currentQuestionIndex,
            score: _score,
            selectedAnswer: _selectedAnswer,
            onOptionSelected: (String answer) {
              setState(() {
                _selectedAnswer = answer;
              });
            },
            onNextQuestion: _answerQuestion,
          );
        }
      },
    );
  }
}
