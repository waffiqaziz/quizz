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
      'A cloud-based mobile development platform',
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
    'options': ['true', '3.1', '5', 'error'],
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
    'options': ['6', '4+2', '42', 'a+b'],
    'answer': '42',
  },
  {
    'question': 'What is the output of that code?',
    'addon': 'var a = 9;\nvar b = 5;\nprint("a>b");',
    'options': ['true', '9>5', 'a>b', 'error'],
    'answer': 'a>b',
  },
  {
    'question':
        'Dart is an open source programming language developed by ......?',
    'addon': '',
    'options': ['Microsoft', 'Oracle', 'Google', 'JetBrains'],
    'answer': 'Google',
  },
  {
    'question':
        'If you initialize a variable as var, once assigned type cannot change?',
    'addon': '',
    'options': ['True', 'False'],
    'answer': 'True',
  },
  {
    'question': 'Dart is native language?',
    'addon': '',
    'options': ['true', 'false'],
    'answer': 'false',
  },
  {
    'question': 'What is the data type of the variable x?',
    'addon': 'num x=18.0;',
    'options': ['num', 'double', 'float', 'int'],
    'answer': 'double',
  },
  {
    'question': 'What is ob1 data type?',
    'addon':
        'main(){\n  var ob1=Car().color;\n}\n\nclass Car{String color=\'red\';}',
    'options': ['car', 'var', 'String', 'non of these'],
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
    'options': ['True', 'False'],
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
    'options': ['debug()', 'build()', 'random()', 'runApp()'],
    'answer': 'build()',
  },
  {
    'question': 'How many types of widgets are there in Flutter?',
    'addon': '',
    'options': ['2', '1', '5', '3'],
    'answer': '2',
  },
  {
    'question':
        'What function that responsible for returning the widgets that are attached to the screen?',
    'addon': '',
    'options': ['Container', 'SizedBox', 'main()', 'runApp()'],
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
  {
    'question': 'Hot reload works by injecting a file updated code into ',
    'addon': '',
    'options': ['JDK', 'Dart VM', 'JRE', 'JVM'],
    'answer': 'Dart VM',
  },
  {
    'question':
        'Main folder on a flutter project thats contain all flutter source code will be in?',
    'addon': '',
    'options': ['dart', 'lib', 'name_project', 'build'],
    'answer': 'lib',
  },
  {
    'question':
        'What are widgets whose state values cannot be changed (immutable), are static, and have limited interactions?',
    'addon': '',
    'options': [
      'Scaffold',
      'Statefull Widget',
      'Stateless Widget',
      'Container',
    ],
    'answer': 'Stateless Widget',
  },
  {
    'question': 'What are Flutter\'s dynamic widgets?',
    'addon': '',
    'options': [
      'StateFull Widget',
      'Container',
      'Material App',
      'Stateless Widget',
    ],
    'answer': 'StateFull Widget',
  },
  {
    'question':
        'What widget that is used to create a basic material design display in a Flutter application, which can also be called the basis of a page?',
    'addon': '',
    'options': ['AppBar', 'Material Apps', 'Scaffold', 'Container'],
    'answer': 'Scaffold',
  },
  {
    'question':
        'What is the Header (top part) of the application or commonly known as toolbar…',
    'addon': '',
    'options': ['TopNav', 'Drawer', 'AppBar', 'Material App'],
    'answer': 'AppBar',
  },
  {
    "question": "What is the output of the following code?",
    "addon":
        "const pi = 3.14;\nvar radius = 5;\nvar area = pi * radius * radius;\nprint('Area: \$area');",
    "options": [
      "Area: 78.5",
      "Area: 78.5;",
      "Area: 3.14 * radius * radius",
      "error",
    ],
    "answer": "Area: 78.5",
  },
  {
    "question": "Which of the following will result in an error?",
    "addon": "",
    "options": [
      "var list = [1, 2, 3];\nprint(list[3]);",
      "var map = {'key': 'value'};\nprint(map['key']);",
      "var set = {1, 2, 3};\nprint(set.contains(1));",
      "var num = 10;\nprint(num.toString());",
    ],
    "answer": "var list = [1, 2, 3];\nprint(list[3]);",
  },
  {
    "question": "What is the output of this code?",
    "addon": "var a = 3;\nvar b = 2;\nvar c = a++ + ++b;\nprint(c);",
    "options": ["6", "7", "5", "error"],
    "answer": "6",
  },
  {
    "question": "What will be printed by the following code?",
    "addon": "var str = 'Hello';\nstr[0] = 'h';\nprint(str);",
    "options": ["hello", "Hello", "error", "'Hello'"],
    "answer": "error",
  },
  {
    "question": "What is the output of this code?",
    "addon":
        "var a = 10;\nvar b = 20;\nvar c = a > b ? 'Greater' : 'Lesser';\nprint(c);",
    "options": ["Greater", "Lesser", "10 > 20", "error"],
    "answer": "Lesser",
  },
  {
    "question": "Which of the following will not compile?",
    "addon": "",
    "options": [
      "int num = null;\nprint(num);",
      "String name = 'Dart';\nprint(name);",
      "List<int> numbers = [1, 2, 3];\nprint(numbers);",
      "var mixedList = [1, 'two', 3.0];\nprint(mixedList[1].length);",
    ],
    "answer": "var mixedList = [1, 'two', 3.0];\nprint(mixedList[1].length);",
  },
  {
    "question": "What will be the output of this code snippet?",
    "addon": "var myFunc = (int a, int b) => a + b;\nprint(myFunc(2, 3));",
    "options": ["5", "error", "int", "null"],
    "answer": "5",
  },
  {
    "question": "What is the output of this code snippet?",
    "addon": "var x = [1, 2, 3];\nvar y = x;\ny[0] = 4;\nprint(x[0]);",
    "options": ["1", "2", "3", "4"],
    "answer": "4",
  },
  {
    "question": "What does the following code print?",
    "addon":
        "void main() {\n  print(foo());\n}\nString foo() => 'Hello World';",
    "options": ["'Hello World'", "'foo()'", "error", "'Hello'"],
    "answer": "'Hello World'",
  },
  {
    "question": "Which of the following correctly declares a constant?",
    "addon": "",
    "options": ["const a = 5;", "final b = 10;", "var c = 15;", "let d = 20;"],
    "answer": "const a = 5;",
  },
  {
    "question": "What is the output of the following code?",
    "addon": "void main() {\n  var a = 5;\n  var b = a++ * 2;\n  print(b);\n}",
    "options": ["10", "12", "11", "error"],
    "answer": "10",
  },
  {
    "question": "What will the following code output?",
    "addon":
        "void main() {\n  var numbers = [1, 2, 3, 4, 5];\n  print(numbers.where((n) => n > 3).toList());\n}",
    "options": ["[4, 5]", "[3, 4, 5]", "[4]", "error"],
    "answer": "[4, 5]",
  },
  {
    "question": "Which of the following will throw an error?",
    "addon": "",
    "options": [
      "int? a = null;\nprint(a);",
      "List<String>? list;\nprint(list.length);",
      "Map<String, int> map = {'one': 1};\nprint(map['two']);",
      "var myNum = 7;\nprint(myNum.isEven);",
    ],
    "answer": "List<String>? list;\nprint(list.length);",
  },
  {
    "question": "What is the output of this code snippet?",
    "addon":
        "void main() {\n  var x = 10;\n  var y = x++;\n  print(y);\n  print(x);\n}",
    "options": ["10, 11", "11, 11", "10, 10", "error"],
    "answer": "10, 11",
  },
  {
    "question": "What does this code print?",
    "addon":
        "void main() {\n  var x = [1, 2, 3];\n  var y = x.map((i) => i * 2).toList();\n  print(y);\n}",
    "options": ["[2, 4, 6]", "[1, 2, 3]", "[2, 3, 4]", "error"],
    "answer": "[2, 4, 6]",
  },
  {
    "question": "What is the output of the following code?",
    "addon":
        "void main() {\n  var a = '10';\n  var b = '5';\n  print(a ~/ b);\n}",
    "options": ["2", "1", "error", "15"],
    "answer": "error",
  },
  {
    "question": "What will be printed by the following code?",
    "addon":
        "void main() {\n  const x = 2;\n  const y = 3;\n  print(x * y == 6);\n}",
    "options": ["true", "false", "error", "6"],
    "answer": "true",
  },
  {
    "question": "What does this code output?",
    "addon":
        "void main() {\n  var a = [1, 2, 3];\n  var b = a;\n  b[0] = 4;\n  print(a[0]);\n}",
    "options": ["1", "2", "3", "4"],
    "answer": "4",
  },
  {
    "question": "What is the output of this code snippet?",
    "addon":
        "void main() {\n  var str = 'Dart';\n  str += ' Programming';\n  print(str);\n}",
    "options": ["'Dart'", "'Dart Programming'", "'Dart+'", "error"],
    "answer": "'Dart Programming'",
  },
  {
    "question": "Which statement is true about the following code?",
    "addon":
        "void main() {\n  var a = 1;\n  if (a is int) {\n    a = 'String';\n  }\n  print(a);\n}",
    "options": ["1", "error", "'String'", "0"],
    "answer": "error",
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

  final numberOfQuestionsToSelect = questions.length < 10
      ? questions.length
      : 10;

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
List<Quizz> convertQuestionsToQuizz(List<Map<String, Object>> questionsJson) {
  return questionsJson
      .map((questionMap) => Quizz.fromMap(questionMap))
      .toList();
}
