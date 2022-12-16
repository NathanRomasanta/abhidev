import 'package:abhidev/pages/InstructorPages/InstructorAttendance.dart';
import 'package:abhidev/pages/InstructorPages/InstructorGrades.dart';
import 'package:abhidev/pages/InstructorPages/InstructorHome.dart';
import 'package:abhidev/pages/InstructorPages/InstructorProfile.dart';
import 'package:abhidev/pages/InstructorPages/tempins.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class InstructorScaffold extends StatefulWidget {
  const InstructorScaffold({Key? key}) : super(key: key);

  @override
  State<InstructorScaffold> createState() => _InstructorScaffoldState();
}

class _InstructorScaffoldState extends State<InstructorScaffold> {

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
          InstructorHome(),
          InstructorGradesPage(),
          InstructorAttendance(),
          InstructorProfilePage()


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
            tabs: [

              GButton(icon: Icons.home, text: 'Home',),
              GButton(icon: Icons.book, text: 'Librares',),
              GButton(icon: Icons.person_add, text: 'Accounts',),
              GButton(icon: Icons.person, text: 'Profile',)
            ],
          )
      ),

    );
  }
}
