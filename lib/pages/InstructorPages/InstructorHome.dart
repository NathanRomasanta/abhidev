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
    return Scaffold(
      body: Text(
        "Instructor Home"
      ),
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
