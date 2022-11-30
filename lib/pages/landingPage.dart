import 'package:abhidev/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Landing"),);/*Scaffold(

      body: StreamBuilder <User?> (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return HomePage();
          }else{
            return Divider();
          }
        },
      ),*/

  }
}
