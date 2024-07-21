import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';
import 'package:knust_exammate/views/program_view/programDetail_view.dart';

class CofScienceView extends StatefulWidget {
  const CofScienceView({super.key});

  @override
  State<CofScienceView> createState() => _CofScienceViewState();
}

class _CofScienceViewState extends State<CofScienceView> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Computer Science", "courses": ["Introduction to Structured Program Design","Circuit Theory","Discrete Mathematics I","Information Systems", "Introductory Electronics", "Data Structures","Ecommerce", "Programming with C++", "Introductory Pure Mathematics", "Web-based Concepts and Development", "Object Oriented Programming with Java", "Communication Skills", "Probability and Statistics",  "Open Source Operating Systems", "Ethical and Legal Implications of Computing", "Linear and Numerical Algebra", "Elements of Economics",  "System Analysis and Design", "Database Concepts and Technologies","Human-Computer Interaction", "Analogue and Digital Electronics", "Assembly Language", "Numerical Methods and Computation", "Programming with Visual Basic", "Mobile Applications", "Survey of Programming Languages", "Introduction to Artificial Intelligence","Computer Architecture", "Computer Graphics", "E-Commerce", "Real-Time and Embedded Systems", "Research Method and IT Project","Literature in English", "Data Communications", "Operating Systems", "Graph Theory and Its Applications", "Introduction to Software Engineering", "Expert Systems", "Computer Networks", "Introduction to Compilers", "Computer Security", "Operations Research","Principles of Management","Financial Accounting"]},
    {"name": "Actuarial Science", "courses": ["Regression Analysis","Financial Accounting", "Literature in English", "Communication Skills","Programming with C++","Elements of Economics","Information Technology"]},
    {"name": "Mathematics", "courses": [ "Linear and Numerical Algebra","Communication Skills","Calculus", "Linear Algebra", "Abstract Algebra"]},
    {"name": "Food Science and Technology", "courses": ["Food Chemistry", "Communication Skills","Food Safety", "Food Engineering"]},
    {"name": "Environmental Science", "courses": ["Ecology", "Environmental Policy", "Communication Skills","Climate Science"]},
    {"name": "Optometry", "courses": ["Visual Optics", "Ocular Disease", "Communication Skills","Clinical Optometry"]},
    {"name": "Chemistry", "courses": ["Organic Chemistry", "Inorganic Chemistry", "Communication Skills","Physical Chemistry"]},
    {"name": "Information Technology", "courses": ["IT Fundamentals", "Network Security","Communication Skills", "Database Management"]},
    {"name": "Statistics", "courses": ["Descriptive Statistics", "Inferential Statistics", "Communication Skills","Statistical Computing"]},
    {"name": "Meteorology and Climate Science", "courses": ["Weather Analysis", "Climate Change", "Communication Skills","Atmospheric Physics"]},
    {"name": "Biochemistry", "courses": ["Molecular Biology", "Communication Skills","Genetics", "Proteomics"]},
    {"name": "Theoretical and Applied Chemistry", "courses": ["Quantum Chemistry", "Spectroscopy", "Communication Skills","Chemical Kinetics"]},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers.where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundUsers = results;
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MainAppView()));
                    },
                    icon: Icon(Icons.arrow_back, size: 30),
                    style: IconButton.styleFrom(foregroundColor: Colors.teal),
                  ),
                  SizedBox(width: 5.0),
                  Image.asset(
                    'images/atomicon.png', // Adjust the path accordingly
                    height: 50, // Adjust the height as needed
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'College of Science',
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
              'Programs',
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
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgramDetailView(
                            programName: _foundUsers[index]['name'],
                            courses: List<String>.from(_foundUsers[index]['courses']),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      key: ValueKey(_foundUsers[index]["name"]),
                      color: Color(0xff008080),
                      elevation: 4,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            _foundUsers[index]['name'],
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
                style: TextStyle(fontSize: 24,
                  color: Colors.teal,
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
