import 'package:flutter/material.dart';
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
          selectedAnswer == option ? MyColors.colorOnPrimary : Colors.grey[200],
      borderRadius: BorderRadius.circular(50),
    );
  }

  static BoxDecoration optionBoxDecorationWeb(
      String? selectedAnswer, String option) {
    return BoxDecoration(
      color:
          selectedAnswer == option ? MyColors.colorOnPrimary : Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    );
  }
}
