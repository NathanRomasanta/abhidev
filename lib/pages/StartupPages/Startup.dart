import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'LogoScreen.dart';


class Startup extends StatefulWidget {
  const Startup({Key ? key}) : super(key: key);

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState () {

    super.initState();
    displayNextScreen();
  }


  displayNextScreen() {
    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context, PageTransition(child: const LogoScreen(), type: PageTransitionType.fade, duration: Duration(milliseconds: 500)));
    });
  }


  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(""),
      ),
    );
  }
}
