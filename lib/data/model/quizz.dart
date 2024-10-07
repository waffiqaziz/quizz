/// Each instance of the `Quizz` class contains the following properties:
///
/// - [question] : A string representing the quiz question.
/// - [addon] : An addon like code or image url.
/// - [option] : A list of strings representing the possible answer options.
/// - [answer] : A string representing the correct answer to the question.
class Quizz {
  String question;
  String addon;
  List<String> option;
  String answer;

  Quizz({
    required this.question,
    required this.addon,
    required this.option,
    required this.answer,
  });

  /// Factory constructor to create a Quizz object from a Map.
  factory Quizz.fromMap(Map<String, dynamic> map) {
    return Quizz(
      question: map['question'],
      addon: map['addon'],
      option: List<String>.from(map['options']),
      answer: map['answer'],
    );
  }
}
