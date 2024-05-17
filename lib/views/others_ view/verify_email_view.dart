import 'package:knust_exammate/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: Color(0xff008080),
        // appBar: AppBar(
        //   backgroundColor: Color(0xff008080),
        //   title: Text(
        //     'Verify email',
        //   ),
        // ),
        body: Center(
          child: Column(
              children: [
                SizedBox(height:40),
                Image.asset(
                  'images/logo2.png', // Adjust the path accordingly
                  height: 100, // Adjust the height as needed
                ),
                SizedBox(height:10),
                Text(
                  'KNUST Exammate',
                  style:TextStyle(
                    fontSize:30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8.0),
                  child: const Text(
                    "Please verify your account by checking your email. If you haven't received the verification email, please press the button below.",
                    style:TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),

                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async{
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();

                  },
                  child: Text(
                      'Send Email Verification',
                      style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xffD4190F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),),
                SizedBox(height: 5,),
                ElevatedButton(
                  onPressed: () async{
                    await   FirebaseAuth.instance.signOut();
                    await
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  child: Text(
                      'Restart',
                      style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xffD4190F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),)
              ]
          ),
        ),
      ),
    );
  }
}
