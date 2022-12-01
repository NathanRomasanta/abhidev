import 'dart:async';
import 'package:abhidev/pages/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}



class _LogoScreenState extends State<LogoScreen> {



  @override
  void initState() {
    displayNextScreen();
  }

  displayNextScreen() {
    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context, PageTransition(child: const AuthGate(), type: PageTransitionType.fade, duration: Duration(milliseconds: 500)));
    });
  }



  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
          child: Container(
            width: 250,
            height: 250,
            child: Image.asset('lib/assets/Logo.png'),
          )),
    );
  }
}
