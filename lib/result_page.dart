import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final List<String> answers;
  final List<Map<String, Object>> questions;

  const ResultPage(
      {super.key,
      required this.score,
      required this.answers,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text('Quiz Result',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Your Score: $score/${questions.length}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card.filled(
                    child: ListTile(
                      title: Text(questions[index]['question'] as String),
                      subtitle: Text(
                        'Your Answer: ${answers[index]}\nCorrect Answer: ${questions[index]['answer']}',
                        style: TextStyle(
                          color: answers[index] == questions[index]['answer']
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
