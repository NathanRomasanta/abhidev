
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

      body: Center(
        child: Column(
          children: [

            SizedBox(height: 100,),
            Text("Student Home"),
            TextButton(onPressed: () {
              SignOut();
            }, child:  Text("Logout"))

          ],
        ),
      ),
    );
  }
  Future SignOut() async {
    FirebaseAuth.instance.signOut();
  }
}
