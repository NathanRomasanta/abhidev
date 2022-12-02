
import 'dart:math';
import 'package:abhidev/main.dart';
import 'package:abhidev/pages/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose()  {
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
                      SignIn();
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

  Future SignIn() async {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(),));
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim());
  }
  on FirebaseAuthException catch (e) {
    print(e);
  }

   navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }

}
