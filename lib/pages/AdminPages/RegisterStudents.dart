import 'package:abhidev/studentPages/studentHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStudents extends StatefulWidget {
  const RegisterStudents({Key? key}) : super(key: key);

  @override
  State<RegisterStudents> createState() => _RegisterStudentsState();
}

class _RegisterStudentsState extends State<RegisterStudents> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();


  @override
  void dispose()  {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: firstnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "First Name",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: lastnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "Last Name",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Register();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(240, 80)),
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              )),


        ),
      ),


    );
  }

  Future Register() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());


      /*FirebaseFirestore.instance.collection("Admins").doc(user?.uid).set({
        "FirstName" : firstnameController,
        "LastName" : lastnameController,
        "uid" : user?.uid,
        "email" : emailController,
        "password" : passwordController,
        "admin" : false,

      }); */
    }
    on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.pop(context);

  }
}
