import 'package:knust_exammate/constants/routes.dart';
import 'package:knust_exammate/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:knust_exammate/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff008080),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Image.asset(
                              'images/logo2.png', // Adjust the path accordingly
                              height: 100, // Adjust the height as needed
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                          child: Text(
                            'Welcome back to',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            'KNUST Exammate',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                controller: _email,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 20.0),
                              TextField(
                                controller: _password,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 40.0),
                              ElevatedButton(
                                onPressed: () async {
                                  final email = _email.text;
                                  final password = _password.text;
                                  try{
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                    final user= FirebaseAuth.instance.currentUser;
                                    if(user?.emailVerified ?? false){
                                      //user email is verified
                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                        mainAppRoute,
                                            (route) => false,
                                      );
                                    }else{
                                      //user email is not verified
                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                          verifyEmailRoute,
                                              (route) => false
                                      );
                                    }

                                  } on FirebaseAuthException catch(e){
                                    if(e.code == 'user-not-found'){
                                      await showErrorDialog(
                                          context,
                                          'User not found'
                                      );
                                    }else if(e.code =='wrong-password'){
                                      await showErrorDialog(
                                          context,
                                          'Wrong credentials'
                                      );
                                    } else{
                                      await showErrorDialog(
                                          context,
                                          'Error: ${e.code}'
                                      );
                                    }
                                  } catch(e){
                                    await showErrorDialog(
                                        context,
                                        e.toString()
                                    );
                                  }
                                },
                                child: Text('Login',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: Color(0xffD4190F),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    'Dont have an account?',
                                    style: TextStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  SizedBox(width: 10),
                                  ElevatedButton(onPressed: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                        signupRoute,
                                            (route) => false
                                    );
                                  },
                                      child: Text('Sign Up',
                                      style:TextStyle(
                                        color: Colors.white
                                      )),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                          )
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],

                    ),
                  ),
                );
              default:
                return const Text('Loading..');
            }
          }

      ),
    );
  }
}