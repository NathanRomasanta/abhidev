import 'package:abhidev/pages/AdminPages/AdminHome.dart';
import 'package:abhidev/pages/AdminPages/AdminLibraries.dart';
import 'package:abhidev/pages/AdminPages/AdminProfile.dart';

import 'package:abhidev/pages/AdminPages/AdminRegisterUsers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AdminScaffold extends StatefulWidget {
  const AdminScaffold({Key? key}) : super(key: key);

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {

  User? user;
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
          AdminHome(),
          AdminLibraries(),
          AdminRegisterUsers(),
          AdminProfile(),


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
