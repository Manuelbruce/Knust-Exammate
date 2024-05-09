import 'package:flutter/material.dart';
import 'package:knust_exammate/views/college_view.dart';
import 'package:knust_exammate/views/college_views/Profile_view.dart';
import 'package:knust_exammate/views/main.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CollegeView(),
    ProfileView(),

    // FeaturedScreen(),
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
               height: 20,
            ),
            icon: Image.asset(
              'images/college.png',
              height: 20,
            ),
            label: "Colleges",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'images/profilewhite.png',
               height: 20,
            ),
            icon: Image.asset(
              'images/profileteal.png',
               height: 20,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
