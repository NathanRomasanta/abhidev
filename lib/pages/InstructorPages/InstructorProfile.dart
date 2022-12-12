import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InstructorProfilePage extends StatelessWidget {
  User? user;

  InstructorProfilePage(DocumentSnapshot<Object?> documentSnapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("admins").doc(user?.uid).snapshots(),
      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text("test");
          default:
            return InstructorProfilePage(snapshot.data!);
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

