import 'package:flutter/material.dart';
import 'package:knust_exammate/firebase_options.dart';
import 'package:knust_exammate/views/college_views/Profile_view.dart';
import 'package:knust_exammate/views/college_views/cofagriandnature_view.dart';
import 'package:knust_exammate/views/college_views/cofbuiltenviron_view.dart';
import 'package:knust_exammate/views/college_views/cofengineering_view.dart';
import 'package:knust_exammate/views/college_views/cofhandsc_view.dart';
import 'package:knust_exammate/views/college_views/cofhealthsc_view.dart';
import 'package:knust_exammate/views/others_%20view/login_view.dart';
import 'package:knust_exammate/views/others_%20view/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/views/others_%20view/verify_email_view.dart';
import 'cofscience_view.dart';

class CollegeView extends StatefulWidget {
  const CollegeView({super.key});

  @override
  State<CollegeView> createState() => _CollegeViewState();
}

class _CollegeViewState extends State<CollegeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                    child: Image.asset(
                      'images/college.png', // Adjust the path accordingly
                      height: 60, // Adjust the height as needed
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Colleges',
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 40.0,
                        color: Color(0xff008080),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofScienceView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/atomicon.png', // Adjust the path accordingly
                            height: 100, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Text(
                              'College of Science',
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofEngineeringView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/engineeringicon.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Text(
                              'College of Engineering',
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofHealthSciencesView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/icons8-caduceus-100.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Text(
                              'College of Health Sciences',
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofBuiltEnvironmentView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/articon.png', // Adjust the path accordingly
                            height: 60, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              children: [
                                Text(
                                  'College of Art and Built ',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Environment ',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofHumanitiesandSocailSciencesView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/social-science.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              children: [
                                Text(
                                  'College of Humanities and',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' Social Sciences',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CofAgricultureandNatureView(),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.teal.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 90.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/agric.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              children: [
                                Text(
                                  'College of Agriculture and',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' Natural Resources',
                                  style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
