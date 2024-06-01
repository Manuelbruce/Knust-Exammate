import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/startTest_view.dart';

class ProgramDetailView extends StatefulWidget {
  final String programName;
  final List<String> courses;

  const ProgramDetailView({
    Key? key,
    required this.programName,
    required this.courses,
  }) : super(key: key);

  @override
  State<ProgramDetailView> createState() => _ProgramDetailViewState();
}

class _ProgramDetailViewState extends State<ProgramDetailView> {
  List<String> _foundCourses = [];

  @override
  void initState() {
    _foundCourses = widget.courses;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.courses;
    } else {
      results = widget.courses
          .where((course) => course.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCourses = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: Column(
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
                    color: Colors.teal,
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: Text(
                      widget.programName,
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 25.0,
                        color: Color(0xff008080),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Courses',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Color(0xff008080),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 10),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Color(0xff008080),
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
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xff008080),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: _foundCourses.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundCourses.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartTestView(courseName: _foundCourses[index]),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                    child: Card(
                      key: ValueKey(_foundCourses[index]),
                      color: Color(0xff008080),
                      elevation: 4,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            _foundCourses[index],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'NunitoSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff008080),
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
