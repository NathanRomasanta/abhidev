import 'package:abhidev/pages/StudentPages/StudentHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'InstructorProfile.dart';


class InstructorHome extends StatefulWidget {
 InstructorHome(DocumentSnapshot<Object?> documentSnapshot, {Key? key}) : super(key: key);

  @override
  State<InstructorHome> createState() => _InstructorHomeState();
}

class _InstructorHomeState extends State<InstructorHome> {

  User? user;
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("admins").doc(user?.uid).snapshots(),
      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text("Loading");
          default:
            return Scaffold(
              body: PageView(
                controller: pageController,
                onPageChanged: (newIndex) {
                  currentIndex = newIndex;
                },
                children: [

                  StudentHome(),
                  InstructorProfilePage(snapshot.data!),
                  InstructorProfile(snapshot.data!)
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
      },
    );

  }

  Center InstructorProfile(DocumentSnapshot snapshot) {
    return Center(child: Column(
      children: [

        Text(snapshot['FirstName']),
        SizedBox(height: 50,),
        Text(snapshot['LastName']),

        ElevatedButton(
          onPressed: () {
            SignOut();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              backgroundColor: Colors.blue,
              fixedSize: const Size(240, 80)),
          child: Text(
            "Logout",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),);
  }




  Future SignOut() async {
    FirebaseAuth.instance.signOut();
  }
}
