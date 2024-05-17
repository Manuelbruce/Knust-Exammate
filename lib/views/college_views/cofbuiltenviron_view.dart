import 'package:flutter/material.dart';
import 'package:knust_exammate/views/others_%20view/main.dart';

class CofBuiltEnvironmentView extends StatefulWidget {
  const CofBuiltEnvironmentView({super.key});

  @override
  State<CofBuiltEnvironmentView> createState() => _CofBuiltEnvironmentViewState();
}

class _CofBuiltEnvironmentViewState extends State<CofBuiltEnvironmentView> {
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
                          'images/articon.png', // Adjust the path accordingly
                          height: 42.0, // Adjust the height as needed
                        ),
                      ),
                      SizedBox(width:3.5),
                      Column(
                        children: [
                          Text('College of  ',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize:22.0,
                               // fontWeight: FontWeight.bold,
                                color: Color(0xff008080)
                            ),

                          ),
                          Text('Art and Built Environment ',
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
    );
  }
}
