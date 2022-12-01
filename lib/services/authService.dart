import 'package:abhidev/pages/LandingPage.dart';
import 'package:abhidev/studentPages/studentHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
/*
  Stream<String> get authStateChanges => _firebaseAuth.authStateChanges().map(
    (User user) => user?.uid,
  );*/

/*
  Future<String> createUserWithEmailAndPassword(String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );

    //Update the Username
    var userUpdateInfo = currentUser();
    userUpdateInfo.displayName =name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;

  }
//Login


*/

//Auth Service
  handleAuthStateStudent() {


  }

//Sign Out
  signOut(){
    FirebaseAuth.instance.signOut();
  }

}