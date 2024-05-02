import 'package:flutter/material.dart';
import 'package:knust_exammate/firebase_options.dart';
import 'package:knust_exammate/views/login_view.dart';
import 'package:knust_exammate/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';
import 'package:knust_exammate/views/verify_email_view.dart';


void main() async {
  runApp(MaterialApp(

    home:  HomePage(),
      routes: {
      signupRoute :(context)=>  SignInView(),
      loginRoute: (context) => LoginView(),
        verifyEmailRoute: (context)  => VerifyEmailView(),
        mainAppRoute:(context) => MainAppView(),
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
    appBar: AppBar(
      backgroundColor: Color(0xff008080),
      actions: [
        PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(
                      context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                          (route) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text('Log out')
                ),
              ];
            }
        )
      ],

    ),
    );
  }
}


Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: const Text(
            'Sign out',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          content: Text(
            'Are you sure you want to Log out ?',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xff008080),
                ),
              ),

            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Log out',
                style: TextStyle(
                  color: Color(0xff008080),
                ),

              ),

            )
          ]
      );
    },
  ).then((value) => value ?? false);
}
