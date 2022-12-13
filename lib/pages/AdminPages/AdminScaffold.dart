import 'package:abhidev/pages/AdminPages/AdminHome.dart';
import 'package:abhidev/pages/AdminPages/AdminProfile.dart';
import 'package:abhidev/pages/AdminPages/RegisterStudents.dart';
import 'package:abhidev/pages/AdminPages/RegisterUsers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        onPageChanged: (newIndex) {
          currentIndex = newIndex;
        },
        children: [
          AdminHome(),
          RegisterUsers(),
          AdminProfile()


        ],
      ),
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Colors.blue,
        onTap: (index) {
          pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.book_sharp, color: Colors.white,),
          Icon(Icons.person, color: Colors.white,)
        ],
      ),




    );
  }
}
