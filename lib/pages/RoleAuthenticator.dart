import 'package:abhidev/pages/AdminPages/AdminScaffold.dart';
import 'package:abhidev/pages/InstructorPages/InstructorScaffold.dart';
import 'package:abhidev/services/ErrorFile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'StudentPages/StudentHome.dart';

class RoleAuthentication extends StatelessWidget {
  RoleAuthentication({Key? key}) : super(key: key);
  late User user;
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
              return CheckRoles(snapshot.data!);
          }
        },
      ),
    );
  }
  CheckRoles (DocumentSnapshot snapshot) {
     if(snapshot['Admin'] == true) {
       return AdminScaffold();
     }else if(snapshot['Instructors'] == true){
       return InstructorScaffold();
     }else{
       return StudentHome();
     }
  }
}
