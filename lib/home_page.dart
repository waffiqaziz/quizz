import 'package:flutter/material.dart';
import 'res/colors.dart';
import 'res/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/main-picture.webp',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                const SizedBox(height: 20),
                Text(
                  Strings.readyQuizz,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: Strings.varela,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  Strings.welcomeMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  Strings.quizInfo,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: Strings.varela, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  child: Text(
                    Strings.startQuizz,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Strings.information,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          Strings.messageInformation,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(Strings.back),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/quiz');
            },
            child: Text(
              Strings.scontinue,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
