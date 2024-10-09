import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/res/colors.dart';
import 'package:quizz/res/styles.dart';

import '../res/strings.dart';

class QuizPageWide extends StatefulWidget {
  final List<Quizz> questions;
  final int currentQuestionIndex;
  final int score;
  final String? selectedAnswer;
  final Function(String) onOptionSelected;
  final VoidCallback onNextQuestion;

  const QuizPageWide({
    super.key,
    required this.questions,
    required this.currentQuestionIndex,
    required this.score,
    required this.selectedAnswer,
    required this.onOptionSelected,
    required this.onNextQuestion,
  });

  @override
  QuizPageWideState createState() => QuizPageWideState();
}

class QuizPageWideState extends State<QuizPageWide> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[widget.currentQuestionIndex];

    return PopScope(
      canPop: false, // Prevent the pop action initially
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return; // If the user has already popped, do nothing
        }
        final shouldPop = await _showExitWarning();
        if (context.mounted && shouldPop) {
          Navigator.pop(context); // Only pop if the user confirmed
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
                padding: MyStyle.horizontal30(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Question number
                    MyStyle.questionNumber(
                        widget.currentQuestionIndex, widget.questions, context),
                    const SizedBox(height: 20),

                    // Addon
                    MyStyle.questionAddon(currentQuestion.addon, context),
                    const SizedBox(height: 10),

                    // Question text
                    MyStyle.questionText(currentQuestion.question, context),
                    const SizedBox(height: 20),

                    // Option
                    if (widget.questions[widget.currentQuestionIndex].option[0]
                            .contains(';') ||
                        widget.questions[widget.currentQuestionIndex].option[0]
                            .contains('t:') ||
                        widget.questions[widget.currentQuestionIndex].option[0]
                            .contains('),'))
                      _optionCodeWidget()
                    else
                      _optionStringWidget(),
                    const SizedBox(height: 20),

                    // Next button
                    FilledButton(
                      onPressed: widget.selectedAnswer == null
                          ? null
                          : widget.onNextQuestion,
                      child: Text(Strings.next),
                    ),
                    const SizedBox(height: 20),

                    // Keyboard Listener
                    _keyboarListener()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  KeyboardListener _keyboarListener() {
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
              widget.selectedAnswer != null) {
            widget.onNextQuestion();
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            _selectNextAnswer();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _selectPreviousAnswer();
          } else if (event.logicalKey == LogicalKeyboardKey.enter) {
            widget.onNextQuestion();
          } else if (event.character == '1' ||
              event.character == '2' ||
              event.character == '3' ||
              event.character == '4') {
            int optionIndex = int.parse(event.character!) - 1;

            // Ensure currentQuestionIndex and option index are valid
            if (widget.currentQuestionIndex < widget.questions.length &&
                optionIndex <
                    widget
                        .questions[widget.currentQuestionIndex].option.length) {
              widget.onOptionSelected(widget
                  .questions[widget.currentQuestionIndex].option[optionIndex]);
            } else {
              // Handle the out-of-bounds situation gracefully
              log("[SAFE] Index out of range: Invalid option or question index for Option KeyboardListener.");
            }
          }
        }
      },
      child: Container(),
    );
  }

  Column _optionCodeWidget() {
    return Column(
      children:
          widget.questions[widget.currentQuestionIndex].option.map((option) {
        return Container(
          decoration:
              MyStyle.optionBoxDecoration(widget.selectedAnswer, option),
          margin: const EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: MyStyle.radius50,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: MyStyle.radius50,
                onTap: () => widget.onOptionSelected(option),
                child: RadioListTile<String>(
                  title: Text(
                    option,
                    style: MyStyle.optionTextStyle(
                        widget.selectedAnswer, option, context),
                  ),
                  groupValue: widget.selectedAnswer,
                  value: option,
                  onChanged: (value) => widget.onOptionSelected(value!),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Row _optionStringWidget() {
    final lengthOption =
        widget.questions[widget.currentQuestionIndex].option.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: (widget.questions[widget.currentQuestionIndex].option)
          .asMap()
          .entries
          .map((entry) {
        String option = entry.value;
        return Flexible(
          child: AspectRatio(
            aspectRatio: 1.9,
            child: Stack(
              children: [
                Container(
                  decoration: MyStyle.optionBoxDecorationWeb(
                      widget.selectedAnswer, option),
                  margin: EdgeInsets.only(
                      right: entry.key < lengthOption - 1 ? 10 : 0),
                  child: InkWell(
                    borderRadius: MyStyle.radius50,
                    onTap: () => widget.onOptionSelected(option),
                    child: Center(
                      child: Padding(
                        // add padding inside flexible
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          option,
                          style: MyStyle.optionTextStyle(
                              widget.selectedAnswer, option, context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  void _selectNextAnswer() {
    if (widget.selectedAnswer == null) {
      widget.onOptionSelected(
          widget.questions[widget.currentQuestionIndex].option[0]);
    } else {
      final currentOptions =
          widget.questions[widget.currentQuestionIndex].option;
      final currentIndex = currentOptions.indexOf(widget.selectedAnswer!);
      final nextIndex = (currentIndex + 1) % currentOptions.length;
      widget.onOptionSelected(currentOptions[nextIndex]);
    }
  }

  void _selectPreviousAnswer() {
    if (widget.selectedAnswer == null) {
      widget.onOptionSelected(
          widget.questions[widget.currentQuestionIndex].option[
              widget.questions[widget.currentQuestionIndex].option.length - 1]);
    } else {
      final currentOptions =
          widget.questions[widget.currentQuestionIndex].option;
      final currentIndex = currentOptions.indexOf(widget.selectedAnswer!);
      final nextIndex = (currentIndex - 1) % currentOptions.length;
      widget.onOptionSelected(currentOptions[nextIndex]);
    }
  }

  Future<bool> _showExitWarning() async {
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
