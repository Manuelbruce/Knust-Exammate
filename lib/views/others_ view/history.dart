import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<Map<String, dynamic>> _testHistory = [];

  @override
  void initState() {
    super.initState();
    _loadTestHistory();
  }

  Future<void> _loadTestHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('testHistory') ?? [];
    setState(() {
      _testHistory = history
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
      _testHistory.sort((a, b) =>
          DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));
    });
  }

  Future<void> _clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('testHistory');
    setState(() {
      _testHistory.clear();
    });
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete History',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          content: Text(
            'Are you sure you want to delete your test history?',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xff008080),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Color(0xff008080),
                ),
              ),
              onPressed: () {
                _clearHistory();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align column items to the start
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0), // Adjust padding as needed
              child: Text(
                'Test History',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 40.0,
                  color: Color(0xff008080),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _testHistory.isEmpty
                  ? Center(
                child: Text(
                  'No test history',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: _testHistory.length,
                itemBuilder: (context, index) {
                  final historyItem = _testHistory[index];
                  final course = historyItem['course'] ?? 'No Course';
                  final score = historyItem['score'] ?? '0';
                  final totalQuestions = historyItem['totalQuestions'] ?? '0';

                  return Card(
                    color: Color(0xff008080),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                course,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '$score%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30, // Larger font size for score
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDeleteConfirmationDialog,
        backgroundColor: Color(0xff008080),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
