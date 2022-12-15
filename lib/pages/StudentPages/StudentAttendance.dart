import 'package:flutter/material.dart';



class StudentAttendancePage extends StatefulWidget {
  const StudentAttendancePage({Key? key}) : super(key: key);

  @override
  State<StudentAttendancePage> createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
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
                    child: const Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
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
