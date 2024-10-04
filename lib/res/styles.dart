import 'package:flutter/material.dart';
import 'colors.dart';

class MyStyle {

  // used if needed 
  static BoxDecoration optionBoxDecoration(
      String? selectedAnswer, String option) {
    return BoxDecoration(
      color: selectedAnswer == option ? MyColors.colorOnPrimary : Colors.grey[200],
      borderRadius: BorderRadius.circular(50),
    );
  }
}