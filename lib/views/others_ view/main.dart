
import 'package:flutter/material.dart';
import 'package:knust_exammate/firebase_options.dart';
import 'package:knust_exammate/utilities/db_connect.dart';
import 'package:knust_exammate/views/others_%20view/aboutpage_view.dart';
import 'package:knust_exammate/views/college_views/Profile_view.dart';
import 'package:knust_exammate/views/college_views/cofagriandnature_view.dart';
import 'package:knust_exammate/views/college_views/cofbuiltenviron_view.dart';
import 'package:knust_exammate/views/college_views/cofengineering_view.dart';
import 'package:knust_exammate/views/college_views/cofhandsc_view.dart';
import 'package:knust_exammate/views/college_views/cofhealthsc_view.dart';
import 'package:knust_exammate/views/others_%20view/history.dart';
import 'package:knust_exammate/views/others_%20view/login_view.dart';
import 'package:knust_exammate/views/others_%20view/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/views/others_%20view/verify_email_view.dart';
import 'package:knust_exammate/views/college_views/college_view.dart';
import '../college_views/cofscience_view.dart';
import 'dart:convert';

void main() async {
  var db= DBconnect();


  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,

    home:  const HomePage(),
      routes: {
      signupRoute :(context)=>  SignInView(),
      loginRoute: (context) => LoginView(),
        verifyEmailRoute: (context)  => const VerifyEmailView(),
        mainAppRoute:(context) => const MainAppView(),
        cofscienceRoute:(context) => const CofScienceView(),
        cofengineeringRoute: (context) => const CofEngineeringView(),
        cofhealthscRoute: (context) => const CofHealthSciencesView(),
        cofbuiltenvironRoute: (context) => const CofBuiltEnvironmentView(),
        cofhandscRoute: (context) => const CofHumanitiesandSocailSciencesView(),
        cofagriandnatureRoute: (context) => const CofAgricultureandNatureView(),
        profileRoute: (context) => const ProfileView(),
        collegeRoute: (context) => const CollegeView(),
        aboutpageRoute: (context) =>  const AboutPageView(),
      }
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  print('Email is Verified');

                } else {
                  return const VerifyEmailView();
                }
              } else {
                return LoginView();
              }
              return const MainAppView();
              // return const MainAppView();
            default:
              return const CircularProgressIndicator();
          }
        }

    );

  }
}


enum MenuAction{ logout}

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    CollegeView(),
    HistoryView(),
    ProfileView(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          color: Colors.white
        ),
        backgroundColor:  Colors.teal,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'images/collegewhite.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'images/college.png',
              height: 24.0,
            ),
            label: "Colleges",

          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'images/historywhite.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'images/history.png',
              height: 24.0,
            ),
            label: "History",

          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'images/profilewhite.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'images/profileteal.png',
              height: 24.0,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}




