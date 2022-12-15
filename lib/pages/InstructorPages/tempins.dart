import 'package:abhidev/StudentPages/studentHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class tempinstructorhome extends StatefulWidget {
  const tempinstructorhome({Key? key}) : super(key: key);

  @override
  State<tempinstructorhome> createState() => _tempinstructorhomeState();
}

class _tempinstructorhomeState extends State<tempinstructorhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [

            SizedBox(height: 100,),
            Text("Instructor Home"),
            TextButton(onPressed: () {
              SignOut();
            }, child:  Text("Logout"))

          ],
        ),
      ),
    );  }

  Future SignOut() async {
    FirebaseAuth.instance.signOut();

  }
}
