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
          backgroundColor: MyColors.colorBackground,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: MyColors.colorBackground,
                floating: true,
                pinned: false, // set true to keep AppBar visible
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: MyStyle.horizontal30(),
                  child: SizedBox(
                    width: 500, // Max width is 500px
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligns content inside the Column to the start (left)
                      children: [
                        MyStyle.questionNumber(
                            currentQuestionIndex, questions, context),
                        const SizedBox(height: 5),
                        MyStyle.questionAddon(currentQuestion.addon, context),
                        const SizedBox(height: 10),
                        MyStyle.questionText(currentQuestion.question, context),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // Option list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Check if the index is within the bounds of the currentQuestion.option list
                    return Container(
                      margin: MyStyle.horizontal30(),
                      child: SizedBox(
                        width: 500,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: MyStyle.optionBoxDecoration(
                              selectedAnswer, currentQuestion.option[index]),
                          child: ClipRRect(
                            borderRadius: MyStyle.radius50,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: MyStyle.radius50,
                                onTap: () => onOptionSelected(
                                    currentQuestion.option[index]),
                                child: RadioListTile<String>(
                                  title: Text(
                                    currentQuestion.option[index],
                                    style: MyStyle.optionTextStyle(
                                        selectedAnswer,
                                        currentQuestion.option[index],
                                        context),
                                  ),
                                  groupValue: selectedAnswer,
                                  value: currentQuestion.option[index],
                                  onChanged: (value) =>
                                      onOptionSelected(value!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: currentQuestion.option.length,
                ),
              ),

              // Next button
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, bottom: 30, top: 20),
                  child: SizedBox(
                    width: 500,
                    child: FilledButton(
                      onPressed: selectedAnswer == null ? null : onNextQuestion,
                      child: Text(Strings.next),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
