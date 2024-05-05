import 'package:flutter/material.dart';
import 'package:knust_exammate/firebase_options.dart';
import 'package:knust_exammate/views/login_view.dart';
import 'package:knust_exammate/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/views/verify_email_view.dart';

import 'college_views/cofscience_view.dart';


void main() async {
  runApp(MaterialApp(

    home:  HomePage(),
      routes: {
      signupRoute :(context)=>  SignInView(),
      loginRoute: (context) => LoginView(),
        verifyEmailRoute: (context)  => VerifyEmailView(),
        mainAppRoute:(context) => MainAppView(),
        cofscienceRoute:(context) => CofScienceView(),
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
    body: SafeArea(
      bottom: true,
      child:  SingleChildScrollView(
        child: Column(

          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 10.0),
                  child: Icon(Icons.account_balance,
                  color:  Color(0xff008080),
                  size: 45.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top:10.0),
                  child: Text('Colleges',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff008080)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:30.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                     padding: const EdgeInsets.only(top:17.0),
                     child: Text('College of Science',
                       style: TextStyle(
                         fontFamily: 'NunitoSans',
                         fontSize:25.0,
                         fontWeight: FontWeight.bold,
                          //color: Colors.white
                       ),

                     ),
                   )
                 ],
               ),
              ),
            ),
            SizedBox(height:15.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      padding: const EdgeInsets.only(top:17.0),
                      child: Text('College of Engineering',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize:25.0,
                          fontWeight: FontWeight.bold,
                          //color: Colors.white
                        ),

                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:15.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      padding: const EdgeInsets.only(top:17.0),
                      child: Text('College of Health Sciences',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize:22.0,
                          fontWeight: FontWeight.bold,
                          //color: Colors.white
                        ),

                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:15.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      height: 70, // Adjust the height as needed
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Column(
                        children: [
                          Text('College of  ',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                          Text('Art and Built Environment ',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:15.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      padding: const EdgeInsets.only(top:5.0),
                      child: Column(
                        children: [
                          Text('College of Humanities',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                          Text('and Social Sciences',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:15.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      padding: const EdgeInsets.only(top:5.0),
                      child: Column(
                        children: [
                          Text('College of Agriculture',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                          Text('and Natural Resources',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize:22.0,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
      ),


    // appBar: AppBar(
    //   backgroundColor: Color(0xff008080),
    //   actions: [
    //     PopupMenuButton<MenuAction>(
    //         onSelected: (value) async {
    //           switch (value) {
    //             case MenuAction.logout:
    //               final shouldLogout = await showLogOutDialog(
    //                   context);
    //               if (shouldLogout) {
    //                 await FirebaseAuth.instance.signOut();
    //                 Navigator.of(context).pushNamedAndRemoveUntil(
    //                   loginRoute,
    //                       (route) => false,
    //                 );
    //               }
    //           }
    //         },
    //         itemBuilder: (context) {
    //           return [
    //             const PopupMenuItem<MenuAction>(
    //                 value: MenuAction.logout,
    //                 child: Text('Log out')
    //             ),
    //           ];
    //         }
    //     )
    //   ],
    //
    // ),
    );
  }
}




