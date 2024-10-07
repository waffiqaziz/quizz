import 'package:flutter/material.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/res/styles.dart';

import '../res/colors.dart';
import '../res/strings.dart';

class QuizPageMobile extends StatelessWidget {
  final List<Quizz> questions;
  final int currentQuestionIndex;
  final int score;
  final String? selectedAnswer;
  final Function(String) onOptionSelected;
  final VoidCallback onNextQuestion;

  const QuizPageMobile({
    super.key,
    required this.questions,
    required this.currentQuestionIndex,
    required this.score,
    required this.selectedAnswer,
    required this.onOptionSelected,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return PopScope(
      canPop: false, // Prevent the pop action initially
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return; // If the user has already popped, do nothing
        }
        final shouldPop = await _showExitWarning(context);
        if (context.mounted && shouldPop) {
          Navigator.pop(context); // Only pop if the user confirmed
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
                    MyStyle.questionNumber(
                        currentQuestionIndex, questions, context),

                    // Question addon
                    MyStyle.questionAddon(currentQuestion.addon, context),
                    const SizedBox(height: 10),

                    // Question text
                    MyStyle.questionText(currentQuestion.question, context),
                    const SizedBox(height: 20),

                    // Option
                    Column(
                      children: currentQuestion.option.map((option) {
                        return Container(
                          decoration: MyStyle.optionBoxDecoration(
                              selectedAnswer, option),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: MyStyle.radius50,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () => onOptionSelected(option),
                                child: RadioListTile<String>(
                                  title: Text(
                                    option,
                                    style: MyStyle.optionTextStyle(
                                        selectedAnswer, option, context),
                                  ),
                                  groupValue: selectedAnswer,
                                  value: option,
                                  onChanged: (value) =>
                                      onOptionSelected(value!),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Next button
                    FilledButton(
                      onPressed: selectedAnswer == null ? null : onNextQuestion,
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

  Future<bool> _showExitWarning(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Strings.areYouSure,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(Strings.warningMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(Strings.no,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(Strings.yes),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
