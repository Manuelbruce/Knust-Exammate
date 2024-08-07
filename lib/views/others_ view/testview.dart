import 'package:flutter/material.dart';
import 'dart:async';
import 'package:knust_exammate/utilities/db_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'score_view.dart';

class TestView extends StatefulWidget {
  final String course;
  final int duration;

  const TestView({
    Key? key,
    required this.course,
    required this.duration,
  }) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late Future<List<Question>> _questionsFuture;
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  Map<int, String> _selectedAnswers = {};
  late int _remainingTimeInSeconds;
  late Timer _timer;

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _questionsFuture = _fetchQuestions();
    _remainingTimeInSeconds = widget.duration * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<List<Question>> _fetchQuestions() async {
    final dbConnect = DBconnect();
    final questions = await dbConnect.getQuestionsByCourse(widget.course);
    questions.shuffle();
    return questions;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeInSeconds > 0) {
          _remainingTimeInSeconds--;
        } else {
          _timer.cancel();
          _finishTest();
        }
      });
    });
  }

  void _selectAnswer(int questionIndex, String option) {
    setState(() {
      if (_selectedAnswers[questionIndex] == option) {
        _selectedAnswers.remove(questionIndex);
      } else {
        _selectedAnswers[questionIndex] = option;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _finishTest() async {
    int score = _calculateScore();

    // Save test history
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('testHistory') ?? [];
    history.add(jsonEncode({
      'course': widget.course,
      'score': score,
      'totalQuestions': _questions.length, // Save total number of questions
      'date': DateTime.now().toIso8601String(),
    }));
    await prefs.setStringList('testHistory', history);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreView(
          course: widget.course,
          score: score,
          totalQuestions: _questions.length,
          answers: _selectedAnswers,
          questions: _questions,
          duration: widget.duration,
        ),
      ),
    );
  }

  int _calculateScore() {
    int score = 0;
    _selectedAnswers.forEach((questionIndex, selectedOption) {
      Question question = _questions[questionIndex];
      if (question.options[selectedOption] == true) {
        score++;
      }
    });
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.course,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Color(0xff008080),
      ),
      body: FutureBuilder<List<Question>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching questions'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No questions available'));
          } else {
            _questions = snapshot.data!;
            return _buildQuestionView();
          }
        },
      ),
    );
  }

  Widget _buildQuestionView() {
    final question = _questions[_currentQuestionIndex];
    final selectedOption = _selectedAnswers[_currentQuestionIndex];

    final answeredQuestionsCount = _selectedAnswers.length;
    final unansweredQuestionsCount = _questions.length - answeredQuestionsCount;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${_currentQuestionIndex + 1}: ${question.title}',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _formatTime(_remainingTimeInSeconds),
              style: TextStyle(fontSize: 20),
            ),
          ),
          ...question.options.keys.map((option) {
            final bool isSelected = selectedOption == option;
            return GestureDetector(
              onTap: () => _selectAnswer(_currentQuestionIndex, option),
              child: Card(
                color: isSelected ? Colors.teal : Colors.white,
                child: ListTile(
                  title: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentQuestionIndex > 0)
                ElevatedButton(
                  onPressed: _previousQuestion,
                  child: Text(
                    'Previous',
                    style: TextStyle(color: Color(0xff008080)),
                  ),
                ),
              if (_currentQuestionIndex < _questions.length - 1)
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text(
                    'Next',
                    style: TextStyle(color: Color(0xff008080)),
                  ),
                ),
              if (_currentQuestionIndex == _questions.length - 1)
                ElevatedButton(
                  onPressed: _finishTest,
                  child: Text(
                    'Finish',
                    style: TextStyle(color: Color(0xff008080)),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            color: Color(0xff008080),
            margin: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Answered: $answeredQuestionsCount / ${_questions.length}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Card(
            elevation: 4,
            color: Color(0xff008080),
            margin: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Unanswered: $unansweredQuestionsCount / ${_questions.length}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
