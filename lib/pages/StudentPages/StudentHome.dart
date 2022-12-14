
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
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
                    child: const Text("Student", style: TextStyle( color: Colors.black, fontSize: 20
                    ), ),),

                ],

              ),
            ),


          ),
        )
    );
  }
}
