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
              return checkRole(snapshot.data!);
          }
        },
      ),
    );
  }

  Center checkRole (DocumentSnapshot snapshot) {
     if(snapshot['admin'] == false){
       return adminPage(snapshot);
     }else{
       return userPage(snapshot);
     }

  }

  Center adminPage(DocumentSnapshot snapshot) {

    return Center(child: Column(
      children: [
        Text(snapshot['uid']),

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

  Center userPage(DocumentSnapshot snapshot) {
    return Center(child: Column(
      children: [
        Text(snapshot['FirstName']),

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
