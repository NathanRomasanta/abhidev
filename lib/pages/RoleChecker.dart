import 'package:abhidev/pages/AdminPages/TempAdminHome.dart';
import 'package:abhidev/pages/InstructorPages/InstructorHome.dart';
import 'package:abhidev/pages/StudentPages/StudentHome.dart';
import 'package:abhidev/studentPages/studentHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {


  HomeScreen({Key? key}) : super(key: key);

  late User user;
  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("admins").doc(user.uid).snapshots(),
        builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState){
            case ConnectionState.waiting: return Text("Loading");
            default:
              return CheckRoles(snapshot.data!);
          }
        },
      ),
    );
  }

  CheckRoles (DocumentSnapshot snapshot) {
     if(snapshot['Admin'] == true){
       return TempAdminHome();
     }else if (snapshot['Instructor'] == true){
       return InstructorHome(snapshot);
     }else{
       return StudentHome();
     }
  }







}
