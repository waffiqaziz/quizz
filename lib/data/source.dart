import 'package:quizz/data/model/quizz.dart';

/// A list of quiz questions, each represented as a map with the following keys:
/// - 'question': The text of the question.
/// - 'options': A list of possible answer options.
/// - 'answer': The correct answer for the question.
/// - 'type': The type of question as defined in the [Quizz] class.
final List<Map<String, Object>> _questions = [
  {
    'question': 'What is Flutter?',
    'options': [
      'A UI toolkit for building natively compiled applications',
      'A programming language used to develop mobile apps',
      'A framework for building cross-platform apps',
      'A cloud-based mobile development platform'
    ],
    'answer': 'A UI toolkit for building natively compiled applications',
    'type': 1,
  },
  {
    'question': 'Which language is used by Flutter?',
    'options': ['Java', 'Swift', 'Dart', 'JavaScript'],
    'answer': 'Dart',
    'type': 1,
  },
  {
    'question': 'What is a Stateful Widget?',
    'options': [
      'A stateless widget',
      'A widget that never re-renders',
      'An immutable widget',
      'A widget that manages its own state and can be rebuilt based on changes',
    ],
    'answer': 'A widget that manages its own state and can be rebuilt based on changes',
    'type': 1,
  },
];

List<Map<String, Object>> getQuestion() {
  return _questions;
}

// /// A function to convert JSON list to a List of Quizz objects.
// List<Quizz> convertQuestionsToQuizz(List<Map<String, dynamic>> questionsJson) {
//   return questionsJson
//       .map((questionMap) => Quizz.fromMap(questionMap))
//       .toList();
// }
