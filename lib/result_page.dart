import 'package:flutter/material.dart';
import 'package:quizz/data/model/quizz.dart';
import 'package:quizz/res/colors.dart';
import 'package:quizz/res/strings.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final List<String> answers;
  final List<Quizz> questions;

  const ResultPage(
      {super.key,
      required this.score,
      required this.answers,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: MyColors.colorBackground,
            floating: true,
            pinned: false, // set true to keep  AppBar visible
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: Text(
              Strings.quizResult,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          // Score text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                Strings.yourScore(score, questions),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),

          // Answer list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Card.filled(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(questions[index].question),
                      subtitle: Text(
                        Strings.yourAnswer(answers, index, questions),
                        style: TextStyle(
                          color: answers[index] == questions[index].answer
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: questions.length,
            ),
          ),

          // Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(Strings.backToHome),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
