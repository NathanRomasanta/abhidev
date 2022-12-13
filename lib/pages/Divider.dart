import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DividerScreen extends StatefulWidget {
  const DividerScreen({Key? key}) : super(key: key);

  @override
  State<DividerScreen> createState() => _DividerScreenState();
}

class _DividerScreenState extends State<DividerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                backgroundColor: Colors.blue,
                fixedSize: const Size(240, 80)),
            child: Text(
              "Instructor Login",
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

            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                backgroundColor: Colors.blue,
                fixedSize: const Size(240, 80)),
            child: Text(
              "Student Login",
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

            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                backgroundColor: Colors.blue,
                fixedSize: const Size(240, 80)),
            child: Text(
              "Admin Login",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),



        ],
      ),
    );
  }

  void NavigateToNextPage() {

  }
}
