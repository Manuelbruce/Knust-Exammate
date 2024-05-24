import 'package:flutter/material.dart';
import 'package:knust_exammate/utilities/db_connect.dart';

class ReviewAnswersView extends StatelessWidget {
  final List<Question> questions;
  final Map<String, bool> answers;

  const ReviewAnswersView({
    Key? key,
    required this.questions,
    required this.answers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Review Answers'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final selectedOption = answers[question.id];
          final correctOption = question.options.entries
              .firstWhere((entry) => entry.value)
              .key;

          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                question.title,
                style: TextStyle(fontSize: 20, fontFamily: 'NunitoSans'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: question.options.keys.map((option) {
                  final isCorrect = question.options[option];
                  final isSelected = selectedOption != null && option == correctOption;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.teal : Colors.black,
                        fontSize: 18,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
