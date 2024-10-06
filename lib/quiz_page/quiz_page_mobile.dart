import 'package:flutter/material.dart';
import 'package:quizz/res/styles.dart';
import '../result_page.dart';
import '../res/colors.dart';
import '../res/strings.dart';

class QuizPageMobile extends StatefulWidget {
  final List<Map<String, Object>> questions;
  const QuizPageMobile({super.key, required this.questions});

  @override
  QuizPageMobileState createState() => QuizPageMobileState();
}

class QuizPageMobileState extends State<QuizPageMobile> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<String> _answers = [];
  late List<Map<String, Object>> _questions; // Initialize later
  bool _isDialogShowing = false;
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _questions = widget.questions;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        {
          if (didPop) {
            return;
          }
          final shouldPop = await _showExitWarning();
          _isDialogShowing = shouldPop;
          if (context.mounted && shouldPop == true) {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        appBar: MyStyle.quizBar,
        backgroundColor: MyColors.colorBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Question number
                    Text(
                      Strings.questionNumber(_currentQuestionIndex, _questions),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),

                    // Addon text
                    if (currentQuestion['addon'] as String != '')
                      Container(
                        width: 500,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          currentQuestion['addon'] as String,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontFamily: Strings.jetBrains),
                        ),
                      ),

                    // Question text
                    Text(
                      currentQuestion['question'] as String,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Option
                    Column(
                      children: (currentQuestion['options'] as List<String>)
                          .map((option) {
                        return Container(
                          decoration: MyStyle.optionBoxDecoration(
                              _selectedAnswer, option),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: MyStyle.radius50,
                            child: Material(
                              // Material widget to handle the ink effect
                              color: Colors
                                  .transparent, // Set color to transparent
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                    50), // Match the border radius
                                onTap: () {
                                  setState(() {});
                                },
                                child: RadioListTile<String>(
                                  title: Text(
                                    option,
                                    style: _selectedAnswer == option
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                  ),
                                  value: option,
                                  groupValue: _selectedAnswer,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAnswer = value;
                                    });
                                  },
                                  activeColor: MyColors.colorPrimary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Next button is enable only if selected
                    FilledButton(
                      onPressed:
                          _selectedAnswer == null ? null : _answerQuestion,
                      child: Text(Strings.next),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _answerQuestion() {
    setState(() {
      _answers.add(_selectedAnswer!);
      if (_selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
        _score++;
      }
      _selectedAnswer = null; // Reset selected answer for the next question
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
                score: _score, answers: _answers, questions: _questions),
          ),
        );
      }
    });
  }

  Future<bool> _showExitWarning() async {
    if (_isDialogShowing) {
      return false; // Prevent showing another dialog
    } else {
      _isDialogShowing = !_isDialogShowing;
    }

    final result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(Strings.areYouSure),
            content: Text(Strings.warningMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  _isDialogShowing = false; // Reset the flag when dismissed
                },
                child: Text(Strings.no),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  _isDialogShowing = false; // Reset the flag when dismissed
                },
                child: Text(Strings.yes),
              ),
            ],
          ),
        ) ??
        false;

    return result;
  }
}
