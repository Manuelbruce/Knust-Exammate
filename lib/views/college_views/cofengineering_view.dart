import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';
import 'package:knust_exammate/views/program_view/programDetail_view.dart';

class CofEngineeringView extends StatefulWidget {
  const CofEngineeringView({super.key});

  @override
  State<CofEngineeringView> createState() => _CofEngineeringViewState();
}

class _CofEngineeringViewState extends State<CofEngineeringView> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Computer Engineering", "courses": ["Environmental Studies","Introduction to IT","Electrical Engineering Technology","Basic Mechanics","Applied Electricity","Communication Skills"]},
    {"name": "Aerospace Engineering", "courses": ["Communication Skills"]},
    {"name": "Materials Engineering", "courses": ["Communication Skills" ]},
    {"name": "Petroleum Engineering", "courses": ["Communication Skills"]},
    {"name": "Telecommunication Engineering", "courses": ["Communication Skills"]},
    {"name": "Geological Engineering", "courses": ["Communication Skills"]},
    {"name": "Biomedical Engineering", "courses": ["Communication Skills"]},
    {"name": "Petrochemical Engineering", "courses": ["Communication Skills"]},
    {"name": "Metallurgical Engineering", "courses": ["Communication Skills"]},
    {"name": "Agricultural Engineering", "courses": ["Communication Skills"]},
    {"name": "Chemical Engineering", "courses": ["Communication Skills"]},
    {"name": "Civil Engineering", "courses": ["Communication Skills"]},
    {"name": "Mechanical Engineering", "courses": ["Communication Skills"]},
    {"name": "Electrical & Eletronic Engineering", "courses": ["Communication Skills"]},
    {"name": "Geomatic Engineering", "courses": ["Communication Skills"]},
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
        child:  Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left:5.0,top: 5),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const MainAppView()));
                  }, icon: Icon(Icons.arrow_back,
                    size: 30,),
                    style: IconButton.styleFrom(
                        foregroundColor: Colors.teal
                    ),
                  ),
                  SizedBox(width:1.0),
                  Image.asset(
                    'images/engineeringicon.png', // Adjust the path accordingly
                    height: 50, // Adjust the height as needed
                  ),
                  SizedBox(width:5.0),
                  Text('College of Engineering',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 25.0,
                        // fontWeight: FontWeight.w900,
                        color: Color(0xff008080)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Programs',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff008080)
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
        )
      )
    );
  }
}





