import 'package:abhidev/studentPages/studentHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Padding(

        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text("Sign In as"),
            Text(user.email!),
            SizedBox(height: 100),
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
                "Log Out",
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
    );
  }

  Future SignOut() async {
    FirebaseAuth.instance.signOut();
  }
}
