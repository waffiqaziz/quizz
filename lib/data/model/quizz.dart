/// Represents a quiz question in the application.
///
/// Each instance of the `Quizz` class contains the following properties:
///
/// - [question] : A string representing the quiz question.
/// - [options] : A list of strings representing the possible answer options.
/// - [answer] : A string representing the correct answer to the question.
class Quizz {
  String question;
  List<String> option;
  String answer;

  Quizz({
    required this.question,
    required this.option,
    required this.answer,
  });

  /// Factory constructor to create a Quizz object from a Map.
  factory Quizz.fromMap(Map<String, dynamic> map) {
    return Quizz(
      question: map['question'],
      option: List<String>.from(map['options']),
      answer: map['answer'],
    );
  }
}
