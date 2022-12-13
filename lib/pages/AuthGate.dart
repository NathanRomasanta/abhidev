import 'package:abhidev/pages/RoleAuthenticator.dart';
import 'package:abhidev/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Something Went Wrong!"),);
          }
          else if (snapshot.hasData){
            return RoleAuthentication();
          }else{
           return LoginScreen();
          }
        }
    );
  }
}
