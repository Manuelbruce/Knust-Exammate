import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_ view/testview.dart';

class StartTestView extends StatefulWidget {
  final String courseName;

  const StartTestView({Key? key, required this.courseName}) : super(key: key);

  @override
  _StartTestViewState createState() => _StartTestViewState();
}

class _StartTestViewState extends State<StartTestView> {
  final TextEditingController _timeController = TextEditingController(text: "120"); // Default time: 120 minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 30),
                    style: IconButton.styleFrom(foregroundColor: Colors.teal),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Start Test',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 30.0,
                      color: Color(0xff008080),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You are about to start a test on ${widget.courseName}.',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 24.0,
                  color: Color(0xff008080),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'You can set you prefered time for this test below.The time cannot be set above 120 minutes',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Time (minutes)',
                labelStyle: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child:ElevatedButton(
                onPressed: () {
                  int duration = int.tryParse(_timeController.text) ?? 120; // Default: 120 minutes
                  if (duration <= 120) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestView(
                          course: widget.courseName,
                          duration: duration,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Error",
                            style: TextStyle(
                              color: Color(0xff008080),
                            ),
                          ),
                          content: Text(
                            "You cannot set the time above 120 minutes.",
                            style: TextStyle(
                              color: Color(0xff008080),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK",
                                style: TextStyle(
                                  color: Color(0xff008080),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff008080),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Start Test',
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