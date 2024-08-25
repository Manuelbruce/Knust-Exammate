import 'package:flutter/material.dart';
import 'package:knust_exammate/views/college_views/cofagriandnature_view.dart';
import 'package:knust_exammate/views/college_views/cofbuiltenviron_view.dart';
import 'package:knust_exammate/views/college_views/cofengineering_view.dart';
import 'package:knust_exammate/views/college_views/cofhandsc_view.dart';
import 'package:knust_exammate/views/college_views/cofhealthsc_view.dart';
import 'cofscience_view.dart';

class CollegeView extends StatefulWidget {
  const CollegeView({super.key});

  @override
  State<CollegeView> createState() => _CollegeViewState();
}

class _CollegeViewState extends State<CollegeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                    child: Image.asset(
                      'images/college.png', // Adjust the path accordingly
                      height: 60, // Adjust the height as needed
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Colleges',
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 40.0,
                        color: Color(0xff008080),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _buildCollegeCard(
                context,
                'College of Science',
                'images/atomicon.png',
                CofScienceView(),
              ),
              SizedBox(height: 15.0),
              _buildCollegeCard(
                context,
                'College of Engineering',
                'images/engineeringicon.png',
                CofEngineeringView(),
              ),
              SizedBox(height: 15.0),
              _buildCollegeCard(
                context,
                'College of Health Sciences',
                'images/icons8-caduceus-100.png',
                CofHealthSciencesView(),
              ),
              SizedBox(height: 15.0),
              _buildCollegeCard(
                context,
                'College of Art and Built Environment',
                'images/articon.png',
                CofBuiltEnvironmentView(),
              ),
              SizedBox(height: 15.0),
              _buildCollegeCard(
                context,
                'College of Humanities and Social Sciences',
                'images/social-science.png',
                CofHumanitiesandSocailSciencesView(),
              ),
              SizedBox(height: 15.0),
              _buildCollegeCard(
                context,
                'College of Agriculture and Natural Resources',
                'images/agric.png',
                CofAgricultureandNatureView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollegeCard(
      BuildContext context, String title, String iconPath, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(35.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              color: Colors.teal.withOpacity(0.6),
            ),
            padding: const EdgeInsets.all(10),
            height: 100.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  iconPath,
                  height: 70,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 17.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
