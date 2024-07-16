import 'package:flutter/material.dart';
import 'package:knust_exammate/utilities/db_connect.dart';
import 'package:knust_exammate/views/college_views/college_view.dart';
import 'review_answers_view.dart';
import 'testview.dart';

class ScoreView extends StatelessWidget {
  final String course;
  final int score;
  final int totalQuestions;
  final Map<int, String> answers; // Changed to Map<int, String>
  final List<Question> questions;
  final int duration;

  const ScoreView({
    Key? key,
    required this.course,
    required this.score,
    required this.totalQuestions,
    required this.answers,
    required this.questions,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scorePercent = (score / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Color(0xff008080),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 75.0, left: 20, right: 20),
          child: Container(
            height: 570,
            width: 600,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 4,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      course,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'NunitoSans',
                        color: Color(0xff008080),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Your Score: ',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff008080),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${scorePercent.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 100,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff008080),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestView(
                            course: course,
                            duration: duration,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff008080),
                      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Retake Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff008080),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Review Answers',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CollegeView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff008080),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Return Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
