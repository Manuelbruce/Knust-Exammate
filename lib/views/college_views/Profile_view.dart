import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/utilities/utils.dart';
import 'package:knust_exammate/views/aboutpage_view.dart';
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

  Future<void> editField() async{
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text("Modify" ),
        content: TextField(
          autofocus: true,
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
          onChanged: (value){
            newValue = value;
            },
        ),
          actions:[ TextButton(
            child: Text('Cancel',
                style: TextStyle(
                  color: Colors.white
                )
            ),
            onPressed:()=>
              Navigator.pop(context),

          ),
            TextButton(
              child: Text('Save',
                  style: TextStyle(
                      color: Colors.white
                  )
              ),
              onPressed:()=>
                  Navigator.of(context).pop(newValue),

            ),
          ]

        )
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
               child: Text(
                 'Manuel Bruce',
                 style:TextStyle(
                   color: Color(0xff545454),
                   fontSize: 40,
                   fontFamily: 'NunitoSans',
                   fontWeight: FontWeight.bold
                 ),
               ),
             ),
            Center(
              child: Text(currentUser.email!,
                style:TextStyle(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileView()),
                  );
                },
                child: Container(
                  height: 90.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xff008080),
                    elevation: 4, // Adjust the elevation value as needed
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/edit.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                       SizedBox(width:15),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Modify',
                             style: TextStyle(
                                 fontFamily: 'NunitoSans',
                                 fontSize: 23.0,
                                 color: Colors.white
                             ),
                           ),

                           Text('Tap to change your data',
                             style: TextStyle(
                                 fontFamily: 'NunitoSans',
                                 fontSize: 12.0,
                                 color: Colors.black54,
                               fontWeight: FontWeight.w900
                             ),),
                         ],
                       ),
                          SizedBox(width: 110,),

                          Center(
                            child: Icon(Icons.arrow_forward_ios,
                            color: Colors.white,),
                          )
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
                    elevation: 4, // Adjust the elevation value as needed
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/about.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          SizedBox(width:15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('About',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 23.0,
                                    color: Colors.white
                                ),
                              ),

                              Text('About Exammate',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 12.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900
                                ),),
                            ],
                          ),
                          SizedBox(width: 148,),

                          Center(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white,),
                          )
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
                    elevation: 4, // Adjust the elevation value as needed
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/signout.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          SizedBox(width:15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SignOut',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 25.0,
                                    color: Colors.white
                                ),
                              ),


                            ],
                          ),
                          SizedBox(width: 150,),

                          Center(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white,),
                          )
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
                    elevation: 4, // Adjust the elevation value as needed
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/bin.png', // Adjust the path accordingly
                            height: 70, // Adjust the height as needed
                          ),
                          SizedBox(width:15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Delete Account',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 23.0,
                                    color: Colors.white
                                ),
                              ),


                            ],
                          ),
                          SizedBox(width: 86),

                          Center(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white,),
                          )
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}


//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
