import 'package:flutter/material.dart';


class StudentGradesPage extends StatefulWidget {
  const StudentGradesPage({Key? key}) : super(key: key);

  @override
  State<StudentGradesPage> createState() => _StudentGradesPageState();
}

class _StudentGradesPageState extends State<StudentGradesPage> {
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

                //Add Items Here
                children: [
                  SizedBox(height: 100),
                  Container(alignment: Alignment.topLeft,
                    child: const Text("Grades", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
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
