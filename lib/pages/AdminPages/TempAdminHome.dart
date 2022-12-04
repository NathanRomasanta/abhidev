import 'package:abhidev/pages/AdminPages/AdminRegister.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../AuthGate.dart';
import 'RegisterUsers.dart';


class TempAdminHome extends StatefulWidget {
  const TempAdminHome({Key? key}) : super(key: key);

  @override
  State<TempAdminHome> createState() => _TempAdminHomeState();
}

class _TempAdminHomeState extends State<TempAdminHome> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(title: Text("Admin Home"),),

      body: SafeArea(
        child: Center(
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                                    NavigateToRegisterAdmin()   ;   },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(240, 80)),
                    child: Text(
                      "Register Admin",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      NavigateToRegisterUsers();
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

  void NavigateToRegisterAdmin () {
    Navigator.push(context, PageTransition(child: const RegisterAdmin(), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 500)));
  }

  void NavigateToRegisterUsers () {
    Navigator.push(context, PageTransition(child: const RegisterUsers(), type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 500)));
  }
}
