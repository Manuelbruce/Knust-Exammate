import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';

class CofHealthSciencesView extends StatefulWidget {
  const CofHealthSciencesView({super.key});

  @override
  State<CofHealthSciencesView> createState() => _CofHealthSciencesViewState();
}

class _CofHealthSciencesViewState extends State<CofHealthSciencesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SafeArea(
            bottom: true,
            child:  SingleChildScrollView(

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

                        Image.asset(
                          'images/icons8-caduceus-100.png', // Adjust the path accordingly
                          height: 50, // Adjust the height as needed
                        ),
                        SizedBox(width:3.0),
                        Text('College of Health Sciences'
                            ,
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 22.0,
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
        ));
  }
}
