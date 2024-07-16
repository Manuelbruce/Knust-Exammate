import 'package:flutter/material.dart';
import 'package:knust_exammate/utilities/db_connect.dart';

class ReviewAnswersView extends StatelessWidget {
  final List<Question> questions;
  final Map<int, String> answers;

  const ReviewAnswersView({
    Key? key,
    required this.questions,
    required this.answers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Review Answers',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 24.0,
                  color: Color(0xff008080),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final correctOptionEntry = question.options.entries
                      .firstWhere((entry) => entry.value, orElse: () => MapEntry('', false));
                  final correctOption = correctOptionEntry.key;
                  final userAnswer = answers[index];
                  final isCorrect = userAnswer == correctOption;

                  Color cardColor;
                  if (userAnswer == null) {
                    cardColor = Colors.white;
                  } else {
                    cardColor = isCorrect
                        ? Colors.lightGreen[100]!
                        : Colors.red[100]!;
                  }

                  return Card(
                    color: cardColor,
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(
                        'Q${index + 1}: ${question.title ?? 'No Title'}',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: question.options.keys.map((option) {
                          final isOptionCorrect = option == correctOption;
                          final isUserAnswer = userAnswer != null && option == userAnswer;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              option,
                              style: TextStyle(
                                color: isOptionCorrect
                                    ? Colors.green
                                    : (isUserAnswer ? Colors.red : Colors.black),
                                fontSize: 18,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff008080),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Return to Home',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
