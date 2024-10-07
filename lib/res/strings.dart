import 'package:quizz/data/model/quizz.dart';

class Strings {
  static String quizz = 'Quizz';

  // HomePage
  static String startQuizz = 'Start Quizz';
  static String readyQuizz = 'Ready for Quizz';
  static String quizInfo = '10 questions ( 2 - 4 minutes )';
  static String information = 'Information';
  static String scontinue = 'Continue';
  static String back = 'Back';
  static String messageInformation = 'Please note: Once you select an option and click \'Next\' button there is no going back. Make sure your choice is final.';
  static String welcomeMessage =
      'Sharpen your Flutter & Dart skills! \nTake on fun quizzes, challenge your knowledge, and become a Flutter pro!';

  // Font Family
  static String flamante = 'Flamante';
  static String nunito = 'Nunito';
  static String varela = 'Varela';
  static String jetBrains = 'JetBrains';

  // QuizPage
  static String areYouSure = 'Are You Sure';
  static String no = 'No';
  static String next = 'N e x t';
  static String yes = 'Yes';
  static String warningMessage =
      'Do you really want to back to main page? Your progress will be lost.';
  static String questionNumber(int currentQuestionIndex, List<Quizz> questions){
    return 'Question ${currentQuestionIndex + 1}/${questions.length}';
  }

  // QuizResult
  static String quizResult = 'Quiz Result';
  static String backToHome = 'Back to Home';
  static String yourScore(int score, List<Quizz> questions) {
    return 'Your Score: $score/${questions.length}';
  }

  static String yourAnswer(
      List<String> answers, int index, List<Quizz> questions) {
    return 'Your Answer: ${answers[index]}\nCorrect Answer: ${questions[index].answer}';
  }

   static String githubUrl = 'https://github.com/waffiqaziz/quizz';
}
