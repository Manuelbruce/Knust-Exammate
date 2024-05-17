import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';

class CofHumanitiesandSocailSciencesView extends StatefulWidget {
  const CofHumanitiesandSocailSciencesView({super.key});

  @override
  State<CofHumanitiesandSocailSciencesView> createState() => _CofHumanitiesandSocailSciencesViewState();
}

class _CofHumanitiesandSocailSciencesViewState extends State<CofHumanitiesandSocailSciencesView> {
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
                              builder: (context) => const MainAppView()
                          )
                          );
                        }, icon: Icon(Icons.arrow_back,
                          size: 30,),
                          style: IconButton.styleFrom(
                              foregroundColor: Colors.teal
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'images/social-science.png', // Adjust the path accordingly
                          height: 42.0, // Adjust the height as needed
                        ),
                      ),
                      SizedBox(width:3.5),
                      Column(
                        children: [
                          Text('College of Humanities ',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize:22.0,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xff008080)
                            ),

                          ),
                          Text(' and Social Sciences ',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize:22.0,
                                //  fontWeight: FontWeight.bold,
                                color: Color(0xff008080)
                            ),

                          ),
                        ],
                      ),
                    ],
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
    );;
  }
}
