import 'package:abhidev/pages/AdminPages/RegisterPages/RegisterAdmin.dart';
import 'package:abhidev/pages/AdminPages/RegisterPages/RegisterInstructors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../AuthGate.dart';
import 'RegisterPages/RegisterStudents.dart';



class AdminRegisterUsers extends StatefulWidget {
  const AdminRegisterUsers({Key? key}) : super(key: key);

  @override
  State<AdminRegisterUsers> createState() => _AdminRegisterUsersState();
}

class _AdminRegisterUsersState extends State<AdminRegisterUsers> {

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
                  Text("Admin Home"),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      NavigateToRegisterAdmin();},
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
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      NavigateToRegisterInstructor();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(240, 80)),
                    child: Text(
                      "Register Instructors",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      NavigateToRegisterStudents();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(240, 80)),
                    child: Text(
                      "Register Students",
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
    Navigator.push(context, PageTransition(
        child: const RegisterAdmin(),
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 500)));
  }

  void NavigateToRegisterInstructor () {
    Navigator.push(context, PageTransition(
        child: const RegisterInstructors(),
        type: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 500)));
  }

  void NavigateToRegisterStudents () {
    Navigator.push(context, PageTransition(
        child: const RegisterStudents(),
        type: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 500)));
  }
}
