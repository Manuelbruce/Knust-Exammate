import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/utilities/utils.dart';
import 'package:knust_exammate/views/others_%20view/aboutpage_view.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Uint8List? _image;
  final currentUser = FirebaseAuth.instance.currentUser!;
  String userName = "Your Name"; // Default name

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Future<void> editField() async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff008080),
        title: Text(
          "Modify",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter New Name',
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                userName = newValue.isNotEmpty ? newValue : userName;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11.0, top: 10.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 50.0,
                  color: Color(0xff008080),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 60,
                    backgroundImage: MemoryImage(_image!),
                  )
                      : const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/profileteal.png'),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                        iconSize: 17,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    bottom: 3,
                    left: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: editField,
                child: Text(
                  userName,
                  style: TextStyle(
                    color: Color(0xff545454),
                    fontSize: 40,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                currentUser.email!,
                style: TextStyle(
                  color: Color(0xff545454),
                  fontSize: 15,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  editField();
                },
                child: Container(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff008080),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/edit.png',
                            height: 70,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Modify',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 23.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Tap to change your data',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPageView()),
                  );
                },
                child: Container(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff008080),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/about.png',
                            height: 70,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 23.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'About Exammate',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  showLogOutDialog(context);
                },
                child: Container(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff008080),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/signout.png',
                            height: 70,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SignOut',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  showDeleteDialog(context);
                },
                child: Container(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff008080),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/bin.png',
                            height: 70,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delete Account',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 23.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
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
