
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
                    }, icon: const Icon(Icons.arrow_back, size: 30,),
                      style: IconButton.styleFrom(
                          foregroundColor: Colors.teal
                      ),
                    ),
                  ),
                  const SizedBox(width:3.5),
                  const Text("About",
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
                padding: const EdgeInsets.all(9.0),
                child: const Text(
                    'KNUST ExamMate is a comprehensive mobile application platform that provides access to a diverse range of practice tests from various courses offered at KNUST. Whether you are interested in Engineering, the Sciences, or the Arts, KNUST ExamMate caters to all your academic practice needs.'
                'Our platform features an extensive collection of practice tests, allowing users to test their knowledge and understanding across multiple subject areas. With KNUST ExamMate, you can take timed practice tests, receive immediate feedback, and monitor your progress, ensuring a thorough and engaging learning experience.'
                'Join a wide community of users who are enhancing their knowledge and skills through the numerous practice tests available on KNUST ExamMate. Our intuitive interface and powerful functionalities make it easy for anyone to access and benefit from our practice tests, regardless of their academic background or goals.'
                'Experience the versatility and efficiency of KNUST ExamMate – your go-to solution for academic practice and self-assessment. Whether you\'re a student, a professional, or simply someone looking to expand your knowledge, KNUST ExamMate has got you covered.'
                    ,
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
