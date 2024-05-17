
import 'package:flutter/material.dart';
import 'package:knust_exammate/views/college_views/Profile_view.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:5.0,top: 5),
                    child: IconButton(onPressed: (){
                      Navigator.push(
                          context,MaterialPageRoute(
                          builder: (context) => const ProfileView()
                      )
                      );
                    }, icon: Icon(Icons.arrow_back,
                      size: 30,),
                      style: IconButton.styleFrom(
                          foregroundColor: Colors.teal
                      ),
                    ),
                  ),
                  SizedBox(width:3.5),
                  Text("About",
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize:50.0,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xff008080)
                    ),

                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(9.0),
                child: Text(
                    'KNUST Exam mate is a mobile application platform that allows anyone to have access to passed questions , simulate examination conditions and track their progress.'
                    ' With KNUST Exam Mate anyone can have access to various past questions from any course KNUST has to offer , whether  Engineering,'
                    ' the sciences or the arts KNUST exam mate has got you covered.'
                    ' Join several people who are testing themselves on various passed questions KNUST has to offer all on the KNUST Exam mate app.',
                   style: TextStyle(
                     fontFamily: 'NunitoSans',
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )
                ),
              )
            ],

          ),
          )
      ),
    );
  }
}
