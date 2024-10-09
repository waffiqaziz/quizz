import 'package:flutter/material.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/res/strings.dart';
import 'colors.dart';

class MyStyle {
  
  static AppBar quizBar = AppBar(
    backgroundColor: MyColors.colorBackground,
  );

  static BorderRadius radius50 = BorderRadius.circular(50);

  // used if needed
  static BoxDecoration optionBoxDecoration(
      String? selectedAnswer, String option) {
    return BoxDecoration(
      color:
          selectedAnswer == option ? MyColors.colorOnPrimary : Colors.grey[300],
      borderRadius: BorderRadius.circular(50),
    );
  }

  static BoxDecoration optionBoxDecorationWeb(
      String? selectedAnswer, String option) {
    return BoxDecoration(
      color:
          selectedAnswer == option ? MyColors.colorOnPrimary : Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    );
  }

  static TextStyle optionTextStyle(
      String? selectedAnswer, String option, BuildContext context) {
    return selectedAnswer == option
        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: option.contains(';') ||
                      option.contains('Text(') ||
                      option.contains('t:')
                  ? Strings.jetBrains
                  : Strings.nunito,
            )
        : Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: option.contains(';') ||
                      option.contains('Text(') ||
                      option.contains('t:')
                  ? Strings.jetBrains
                  : Strings.nunito,
            );
  }

  static BoxDecoration boxDecorAddon() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(style: BorderStyle.solid));
  }

  static Text questionText(String question, BuildContext context) {
    return Text(
      question,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  static Text questionNumber(
      int currentQuestionIndex, List<Quizz> questions, BuildContext context) {
    return Text(
      Strings.questionNumber(currentQuestionIndex, questions),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  static Container questionAddon(String addon, BuildContext context) {
    if (addon != '') {
      return Container(
        width: 500,
        padding: const EdgeInsets.all(16),
        decoration: MyStyle.boxDecorAddon(),
        child: Text(
          addon,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: Strings.jetBrains,
              ),
        ),
      );
    } else {
      return Container();
    }
  }

  static EdgeInsets horizontal30(){
    return const EdgeInsets.symmetric(horizontal: 30);
  }
}
