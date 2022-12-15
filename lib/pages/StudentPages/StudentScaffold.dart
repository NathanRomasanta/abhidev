import 'package:abhidev/pages/StudentPages/StudentAttendance.dart';
import 'package:abhidev/pages/StudentPages/StudentGrades.dart';
import 'package:abhidev/pages/StudentPages/StudentHome.dart';
import 'package:abhidev/pages/StudentPages/StudentProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class StudentScaffold extends StatefulWidget {
 StudentScaffold({Key? key}) : super(key: key);

  @override
  State<StudentScaffold> createState() => _StudentScaffoldState();
}

class _StudentScaffoldState extends State<StudentScaffold> {


  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          currentIndex = page;

          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget> [

          StudentHome(),
          StudentGradesPage(),
          StudentAttendancePage(),
          StudentProfilePage(),
        ],
      ),
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: SizedBox(
          height: 100,
          child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (value) {
              currentIndex = value;
              pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.easeInOutCubic);
            },
            backgroundColor: Colors.white,
            activeColor:Color(0xFF3b85fd),
            tabs: const [

              GButton(icon: Icons.home, text: 'Home',),
              GButton(icon: Icons.book, text: 'Grades',),
              GButton(icon: Icons.person_add, text: 'Attendance',),
              GButton(icon: Icons.person, text: 'Profile',)
            ],
          )
      ),

    );
  }
}
