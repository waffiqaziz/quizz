import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/res/colors.dart';
import 'package:quizz/res/styles.dart';
import '../result_page.dart';
import '../res/strings.dart';

class QuizPageWide extends StatefulWidget {
  final List<Quizz> questions;
  const QuizPageWide({super.key, required this.questions});

  @override
  QuizPageWideState createState() => QuizPageWideState();
}

class QuizPageWideState extends State<QuizPageWide> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<String> _answers = [];
  late List<Quizz> _questions; // Initialize later
  bool _isDialogShowing = false;
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _questions = widget.questions;
    ServicesBinding.instance.keyboard.addHandler(_handleKey);
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(_handleKey);
    super.dispose();
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
          child: Center(
            child: SizedBox(
              width: 900,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Question number
                    Text(
                      Strings.questionNumber(_currentQuestionIndex, _questions),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),

                    // Show addon text
                    if (currentQuestion.addon != '')
                      Container(
                        width: 500,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          currentQuestion.addon,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontFamily: Strings.jetBrains),
                        ),
                      ),

                    // Question text
                    const SizedBox(height: 10),
                    Text(
                      currentQuestion.question,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          (currentQuestion.option).asMap().entries.map((entry) {
                        int index = entry.key;
                        String option = entry.value;

                        return Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: MyStyle.optionBoxDecorationWeb(
                                      _selectedAnswer, option),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    borderRadius: MyStyle.radius50,
                                    onTap: () {
                                      setState(() {
                                        _selectedAnswer = option;
                                      });
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          option,
                                          style: _selectedAnswer == option
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        option.contains(';') ||
                                                                option.contains(
                                                                    'Text(') ||
                                                                option.contains(
                                                                    't:')
                                                            ? Strings.jetBrains
                                                            : Strings.nunito,
                                                  )
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontFamily:
                                                        option.contains(';') ||
                                                                option.contains(
                                                                    'Text(') ||
                                                                option.contains(
                                                                    't:')
                                                            ? Strings.jetBrains
                                                            : Strings.nunito,
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Keyboard helper
                                Positioned(
                                  top: 8,
                                  right: 20,
                                  child: CircleAvatar(
                                    backgroundColor: _selectedAnswer == option
                                        ? MyColors.colorOnPrimary
                                        : Colors.grey[300],
                                    maxRadius: 13,
                                    child: Text(
                                      (index + 1).toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: _selectedAnswer == option
                                                ? MyColors.colorPrimary
                                                : Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Next button is enabled only if oprion is selected
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

  void rowOption() {}

  void columnOption() {}

  void _answerQuestion() {
    setState(() {
      _answers.add(_selectedAnswer!);
      if (_selectedAnswer == _questions[_currentQuestionIndex].answer) {
        _score++;
      }
      _selectedAnswer = null; // Reset selected answer for the next question

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++; // trigger to next question (next index)
      } else {
        // open ResultPage if all questions has been show
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

  bool _handleKey(KeyEvent event) {
    log('KeyboardListener: ${event.logicalKey.keyLabel}');
    // Check if running on web or not
    if (event is KeyDownEvent && kIsWeb) {
      // Enter listener
      if (event.logicalKey.keyLabel == 'Enter') {
        // Trigger the button action if an answer is selected
        if (_selectedAnswer != null) {
          _answerQuestion();
        }
      }

      // Check for key presses '1', '2', or '3' and update the selection accordingly
      if (event.character == '1') {
        setState(() {
          _selectedAnswer = (_questions[_currentQuestionIndex].option)[0];
        });
      } else if (event.character == '2') {
        setState(() {
          _selectedAnswer = (_questions[_currentQuestionIndex].option)[1];
        });
      } else if (event.character == '3') {
        setState(() {
          _selectedAnswer = (_questions[_currentQuestionIndex].option)[2];
        });
      } else if (event.character == '4') {
        setState(() {
          _selectedAnswer = (_questions[_currentQuestionIndex].option)[3];
        });
      } else if (event.logicalKey.keyLabel == 'Escape') {
        _showExitWarning();
      }
    }
    return false;
  }
}
