import 'package:flutter/material.dart';


class InstructorGradesPage extends StatefulWidget {
  const InstructorGradesPage({Key? key}) : super(key: key);

  @override
  State<InstructorGradesPage> createState() => _InstructorGradesPageState();
}

class _InstructorGradesPageState extends State<InstructorGradesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: 350,
            height: 720,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(alignment: Alignment.topLeft,
                    child: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                    ), ),),

                  Container(alignment: Alignment.topLeft,
                    child: const Text("Student", style: TextStyle( color: Colors.black, fontSize: 20
                    ), ),),

                ],

              ),
            ),


          ),
        )
    );
  }
}
