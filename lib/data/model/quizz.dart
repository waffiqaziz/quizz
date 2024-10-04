/// Represents a quiz question in the application.
///
/// Each instance of the `Quizz` class contains the following properties:
///
/// - [question] : A string representing the quiz question.
/// - [options] : A list of strings representing the possible answer options.
/// - [answer] : A string representing the correct answer to the question.
/// - [type] : An integer indicating the type of question:
///   - 1: Both the question and answer are strings.
///   - 2: The question is code, and the options are strings.
///   - 3: The question is picture, and the options are strings.
///   - 4: The question is an image, and the options are strings.
///   - etc (Additional type for future use, can be defined as needed.).
class Quizz {
  String question;
  List<String> option;
  String answer;
  int type;

  Quizz({
    required this.question,
    required this.option,
    required this.answer,
    required this.type,
  });

  /// Factory constructor to create a Quizz object from a Map.
  factory Quizz.fromMap(Map<String, dynamic> map) {
    return Quizz(
      question: map['question'],
      option: List<String>.from(map['options']),
      answer: map['answer'],
      type: map['type'],
    );
  }
}
