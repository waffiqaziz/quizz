import 'dart:math';

import 'package:quizz/data/model/quizz.dart';

/// A list of quiz questions, each represented as a map with the following keys:
/// - 'question': The text of the question.
/// - 'addon': An addon like code or image url.
/// - 'options': A list of possible answer options.
/// - 'answer': The correct answer for the question.
final List<Map<String, Object>> _questions = [
  {
    'question': 'What is Flutter?',
    'addon': '',
    'options': [
      'A UI toolkit for building natively compiled applications',
      'A programming language used to develop mobile apps',
      'A framework for building cross-platform apps',
      'A cloud-based mobile development platform'
    ],
    'answer': 'A UI toolkit for building natively compiled applications',
  },
  {
    'question': 'Which language is used by Flutter?',
    'addon': '',
    'options': ['Java', 'Swift', 'Dart', 'JavaScript'],
    'answer': 'Dart',
  },
  {
    'question': 'What is a Stateful Widget?',
    'addon': '',
    'options': [
      'A stateless widget',
      'A widget that never re-renders',
      'An immutable widget',
      'A widget that manages its own state and can be rebuilt based on changes',
    ],
    'answer':
        'A widget that manages its own state and can be rebuilt based on changes',
  },
  {
    'question': 'What is the output of that code?',
    'addon': 'const R = 3.1;\nR=5;\nprint(R);',
    'options': [
      'true',
      '3.1',
      '5',
      'error',
    ],
    'answer': 'error',
  },
  {
    'question': 'Which one print 10?',
    'addon': '',
    'options': [
      'int num =9;\nprint ("the number is \$num + 1");',
      'int num =9;\nprint ("the number is \${num + 1}");',
      'int num =9;\nprint ("the number is num +1");',
      'int num =9;\nprint ("the number is " + (num +1));',
    ],
    'answer': 'int num =9;\nprint ("the number is \${num + 1}");',
  },
  {
    'question': 'What is the output of that code?',
    'addon': 'var a ="4";\nvar b ="2";\nprint(a+b);',
    'options': [
      '6',
      '4+2',
      '42',
      'a+b',
    ],
    'answer': '42',
  },
  {
    'question': 'What is the output of that code?',
    'addon': 'var a = 9;\nvar b = 5;\nprint("a>b");',
    'options': [
      'true',
      '9>5',
      'a>b',
      'error',
    ],
    'answer': 'a>b',
  },
  {
    'question':
        'Dart is an open source programming language developed by ......?',
    'addon': '',
    'options': [
      'Microsoft',
      'Oracle',
      'Google',
      'JetBrains',
    ],
    'answer': 'Google',
  },
  {
    'question':
        'If you initialize a variable as var, once assigned type cannot change?',
    'addon': '',
    'options': [
      'True',
      'False',
    ],
    'answer': 'True',
  },
  {
    'question': 'Dart is native language?',
    'addon': '',
    'options': [
      'true',
      'false',
    ],
    'answer': 'false',
  },
  {
    'question': 'What is the data type of the variable x?',
    'addon': 'num x=18.0;',
    'options': [
      'num',
      'double',
      'float',
      'int',
    ],
    'answer': 'double',
  },
  {
    'question': 'What is ob1 data type?',
    'addon':
        'main(){\n  var ob1=Car().color;\n}\n\nclass Car{String color=\'red\';}',
    'options': [
      'car',
      'var',
      'String',
      'non of these',
    ],
    'answer': 'String',
  },
  {
    'question':
        'A container can be decorated with a _____________, such as a background, a border, or a shadow',
    'addon': '',
    'options': [
      'BoxDecoration',
      'boxDecorator',
      'None of the above',
      'Both can be used',
    ],
    'answer': 'BoxDecoration',
  },
  {
    'question': 'Flutter is not a language; it is an SDK',
    'addon': '',
    'options': [
      'True',
      'False',
    ],
    'answer': 'True',
  },
  {
    'question': 'Which one of the following is a disadvantage of flutter?',
    'addon': '',
    'options': [
      'Hot Reload',
      'Hot Restart',
      'Increased App Size',
      'Increased Productivity',
    ],
    'answer': 'Increased App Size',
  },
  {
    'question':
        'What is the command to verify that the Flutter environment is set up correctly??',
    'addon': '',
    'options': [
      'flutter run',
      'flutter doctor',
      'flutter surgeon',
      'dart export',
    ],
    'answer': 'flutter doctor',
  },
  {
    'question':
        'Which of these functions contain code which houses the widgets of your app?',
    'addon': '',
    'options': [
      'debug()',
      'build()',
      'random()',
      'runApp()',
    ],
    'answer': 'build()',
  },
  {
    'question': 'How many types of widgets are there in Flutter?',
    'addon': '',
    'options': [
      '2',
      '1',
      '5',
      '3',
    ],
    'answer': '2',
  },
  {
    'question':
        'What function that responsible for returning the widgets that are attached to the screen?',
    'addon': '',
    'options': [
      'Container',
      'SizedBox',
      'main()',
      'runApp()',
    ],
    'answer': 'runApp()',
  },
  {
    'question':
        'When using a Text, theres a way to use a pre-configured theme. Which section makes use of this functionality correctly?',
    'addon': '',
    'options': [
      'Text("Michael",style: TextStyle(fontWeight: FontWeight.bold),),',
      'Text("Michael", style: TextStyle(color: Colors.red,  fontWeight: fontWeight.bold),),',
      'Text("Michael", Theme.of(context).textTheme.titleLarge),',
      'Text("Michael",  style: Theme.of(context).textTheme.titleLarge),',
    ],
    'answer':
        'Text("Michael",  style: Theme.of(context).textTheme.titleLarge),',
  },
  {
    'question':
        'In a set of Widgets aligned in column form, what property makes all children of these columns aligned to the left?',
    'addon': '',
    'options': [
      'crossAxisAlignment: CrossAxisAlignment.start',
      'mainAxisAlignment: MainAxisAlignment.start',
      'crossAxisAlignment: CrossAxisAlignment.left',
      'crossAxisAlignment: start',
    ],
    'answer': 'crossAxisAlignment: CrossAxisAlignment.start',
  },
];

// Format questions
// {
//   'question': '',
//   'addon': '',
//   'options': [
//     '',
//     '',
//     '',
//     '',
//   ],
//   'answer': '',
// },

// get 10 random question
List<Map<String, Object>> getRandomQuestions() {
  final questions = getQuestions();
  final selectedQuestions = <Map<String, Object>>[];

  final numberOfQuestionsToSelect =
      questions.length < 10 ? questions.length : 10;

  while (selectedQuestions.length < numberOfQuestionsToSelect) {
    var randomIndex = Random().nextInt(questions.length);
    var randomQuestion = questions[randomIndex];

    if (!selectedQuestions.contains(randomQuestion)) {
      selectedQuestions.add(randomQuestion);
    }
  }

  return selectedQuestions;
}

// get all questions
List<Map<String, Object>> getQuestions() {
  return _questions;
}

/// A function to convert JSON list to a List of Quizz objects.
List<Quizz> convertQuestionsToQuizz(List<Map<String, Object>>  questionsJson) {
  return questionsJson
      .map((questionMap) => Quizz.fromMap(questionMap))
      .toList();
}
