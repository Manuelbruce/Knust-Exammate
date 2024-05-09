import 'package:flutter/material.dart';
import 'package:knust_exammate/views/main.dart';

class CofScienceView extends StatefulWidget {
  const CofScienceView({super.key});

  @override
  State<CofScienceView> createState() => _CofScienceViewState();
}

class _CofScienceViewState extends State<CofScienceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            bottom: true,
            child: SingleChildScrollView(

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:5.0,top: 5),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const MainAppView()));
                        }, icon: Icon(Icons.arrow_back,
                        size: 30,),
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.teal
                          ),
                        ),
                        SizedBox(width:5.0),
                        Image.asset(
                          'images/atomicon.png', // Adjust the path accordingly
                          height: 50, // Adjust the height as needed
                        ),
                        SizedBox(width:5.0),
                        Text('College of Science',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 30.0,
                              // fontWeight: FontWeight.w900,
                              color: Color(0xff008080)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Programmes',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 30.0,
                         fontWeight: FontWeight.w900,
                        color: Color(0xff008080)
                    ),
                  ),
                ],
              ),

            )
        )
    );
  }
}
