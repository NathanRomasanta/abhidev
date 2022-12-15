import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AdminProfile extends StatefulWidget {

  AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
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
          case ConnectionState.waiting: return Container(color: Colors.white,);
          default:
            return AdminProfile(snapshot.data!);
        }
      },
    );
  }


  Scaffold AdminProfile(DocumentSnapshot snapshot) {
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
                        child: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                        ), ),),

                      Container(alignment: Alignment.topLeft,
                        child: const Text("Admin", style: TextStyle( color: Colors.black, fontSize: 20
                        ), ),),
                      SizedBox(height: 70),
                      Container(alignment: Alignment.center,
                        child:  Text(snapshot['FirstName'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                        ), ),),
                      Container(alignment: Alignment.center,
                        child:  Text(snapshot['LastName'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 35
                        ), ),),
                      SizedBox(height: 20),

                      Container(alignment: Alignment.center,
                        child: const Text("Admin", style: TextStyle( color: Colors.black, fontSize: 20
                        ), ),),
                      SizedBox(height: 2),
                      Container(alignment: Alignment.center,
                        child:  Text(snapshot['Email'], style: TextStyle( color: Colors.black, fontSize: 20
                        ), ),),





                      SizedBox(height: 190),
                      Container(


                        child: ElevatedButton(
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
                        ),)
                    ],

                  ),
                ),


          ),
        )
    );



  }

  Future SignOut() async {

    showDialog(context: context,
        builder: (context) => AlertDialog(title:
        Text("Logout?"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("No")),

            TextButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            }, child: Text("Yes")),
          ],
        ));

  }



}
