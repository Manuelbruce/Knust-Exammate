import 'package:flutter/material.dart';
import 'package:knust_exammate/utilities/db_connect.dart';
import 'review_answers_view.dart';
import 'package:knust_exammate/views/program_view/programDetail_view.dart';

class ScoreView extends StatelessWidget {
  final String course;
  final int score;
  final int totalQuestions;
  final Map<String, bool> answers;
  final List<Question> questions;

  const ScoreView({
    Key? key,
    required this.course,
    required this.score,
    required this.totalQuestions,
    required this.answers,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Score - $course'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score / $totalQuestions',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'NunitoSans',
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramDetailView(
                      programName: course,
                      courses: [], // Placeholder, replace with actual course data
                    ),
                  ),
                );
              },
              child: Text('Retake Test'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewAnswersView(
                      questions: questions,
                      answers: answers,
                    ),
                  ),
                );
              },
              child: Text('Review Answers'),
            ),
          ],
        ),
      ),
    );
  }
}
