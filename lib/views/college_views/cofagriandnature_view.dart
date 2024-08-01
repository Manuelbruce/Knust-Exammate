import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';
import 'package:knust_exammate/views/program_view/programDetail_view.dart';

class CofAgricultureandNatureView extends StatefulWidget {
  const CofAgricultureandNatureView({super.key});

  @override
  State<CofAgricultureandNatureView> createState() => _CofAgricultureandNatureViewState();
}

class _CofAgricultureandNatureViewState extends State<CofAgricultureandNatureView> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "LandScape Design & Management", "courses": ["Communication Skills"]},
    {"name": "Agricultural Biotechnology", "courses": ["Communication Skills"]},
    {"name": "Agribusiness Management", "courses": ["Communication Skills"]},
    {"name": "Forest Resources Technology", "courses": ["Communication Skills"]},
    {"name": "Aquaculture & Water Resources Management", "courses": ["Communication Skills"]},
    {"name": "Dairy & Meat Science Technology", "courses": ["Communication Skills"]},
    {"name": "Agriculture", "courses": ["Communication Skills"]},
    {"name": " Natural Resources Management", "courses": ["Communication Skills"]},
    {"name": "Post Harvest Technology", "courses": ["Communication Skills"]},
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
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:5.0,top: 5),
                      child: IconButton(onPressed: (){
                        Navigator.push(
                            context,MaterialPageRoute(
                            builder: (context) => const MainAppView()
                        )
                        );
                      }, icon: Icon(Icons.arrow_back,
                        size: 30,),
                        style: IconButton.styleFrom(
                            foregroundColor: Colors.teal
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.asset(
                        'images/agric.png', // Adjust the path accordingly
                        height: 42.0, // Adjust the height as needed
                      ),
                    ),
                    SizedBox(width:3.5),
                    Column(
                      children: [
                        Text('College of Agriculture ',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xff008080)
                          ),

                        ),
                        Text(' and Natural Resources ',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              //  fontWeight: FontWeight.bold,
                              color: Color(0xff008080)
                          ),

                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Text('Programs',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff008080)
                  ),
                ), SizedBox(height: 10.0),
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
    );;
  }
}
