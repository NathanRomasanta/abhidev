import 'package:abhidev/pages/StudentPages/StudentHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'InstructorProfile.dart';


class InstructorHome extends StatefulWidget {
 InstructorHome( {Key? key}) : super(key: key);

  @override
  State<InstructorHome> createState() => _InstructorHomeState();
}

class _InstructorHomeState extends State<InstructorHome> {


  @override
  Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: 350,
            height: 720,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(alignment: Alignment.topLeft,
                    child: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                    ), ),),

                  Container(alignment: Alignment.topLeft,
                    child: const Text("Instructor", style: TextStyle( color: Colors.black, fontSize: 20
                    ), ),),

                ],

              ),
            ),


          ),
        )
    );

  }

}

