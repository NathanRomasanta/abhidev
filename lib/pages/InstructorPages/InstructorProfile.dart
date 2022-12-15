import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InstructorProfilePage extends StatelessWidget {

  InstructorProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("Accounts").doc(user.email).snapshots(),
      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text("test");
          default:
            return InstructorProfile(snapshot.data!);
        }
      },
    );
  }

  Scaffold InstructorProfile(DocumentSnapshot snapshot) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: 400,
            height: 800,
            child: Container(
              child: Center(
                child: Stack(
                  children: [
                    Container(padding: const EdgeInsets.only(right:210, bottom: 400),
                      child: Text(snapshot['FirstName'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25
                      ), ),),

                    Container(padding: const EdgeInsets.only(right:210, top: 50),
                      child: Text(snapshot['LastName'], style: TextStyle( color: Colors.black, fontSize: 20
                      ), ),),

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

                ),
              ),
            ),
          ),
        )
    );
  }


  Future SignOut() async {

    FirebaseAuth.instance.signOut();
  }
}

