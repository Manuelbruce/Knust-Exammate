import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knust_exammate/utilities/utils.dart';
import 'package:knust_exammate/views/editprofile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Uint8List? _image;
 final currentUser = FirebaseAuth.instance.currentUser!;
  void selectImage() async{
 Uint8List img = await pickImage(ImageSource.gallery);
 setState(() {
   _image = img;
 });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        bottom: true,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:11.0,top:10.0),
              child: Text('Profile',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 50.0,
                  color: Color(0xff008080)
              ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Stack(
                children: [
                  _image != null?
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: MemoryImage(_image!),
                      )
                  :
                const  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/profileteal.png'),
                  ),
                  Positioned(child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                      iconSize: 17,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap

                    ),
                  ),
                    bottom:3,
                    left: 80,
                  ),

                ],
              ),

            ),
             SizedBox(height: 10),
             Center(
               child: Text('Manuel Bruce',
                 style:TextStyle(
                   color: Color(0xff545454),
                   fontSize: 40,
                 ),
               ),
             ),
            Center(
              child: Text(currentUser.email!,
                style:TextStyle(
                  color: Color(0xff545454),
                  fontSize: 15,
                ),
              ),
            ),
              SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.teal.withOpacity(0.6),
                ),
                padding: const EdgeInsets.all(10),
                height: 55.0,
              ),
            )

          ],
        )
      ),
    );
  }
}
