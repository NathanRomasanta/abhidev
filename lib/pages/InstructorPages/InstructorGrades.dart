import 'package:abhidev/pages/InstructorPages/CoursesPages/BusinessAdStudentsPage.dart';
import 'package:abhidev/pages/InstructorPages/CoursesPages/MOAStudents.dart';
import 'package:abhidev/pages/InstructorPages/CoursesPages/PHAStudentPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../services/ErrorPage.dart';


class InstructorGradesPage extends StatefulWidget {
  const InstructorGradesPage({Key? key}) : super(key: key);

  @override
  State<InstructorGradesPage> createState() => _InstructorGradesPageState();
}

class _InstructorGradesPageState extends State<InstructorGradesPage> {



  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Accounts").doc(user.email).snapshots(),
        builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState){
            case ConnectionState.waiting: return const SpinKitFoldingCube(
              size: 140,
              color: Colors.white,
            );
            default:
              return CheckCourse(snapshot.data!);
          }
        },
      ),
    );
  }
  CheckCourse (DocumentSnapshot snapshot) {
    if(snapshot['Course'] == "MOA") {
      return MOAStudentsPage();
    }else if(snapshot['Course'] == "Accounting&Payroll"){
      return BusinessAdStudentsPage();
    }
    else if(snapshot['Course'] == "Accounting&Payroll") {
      return BusinessAdStudentsPage();
    }else{
      return ErrorPage();
    }
  }

}
