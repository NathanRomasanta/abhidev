import 'package:abhidev/pages/Startup.dart';
import 'package:flutter/material.dart';



class studentHome extends StatefulWidget {
  const studentHome({Key? key}) : super(key: key);

  @override
  State<studentHome> createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text("Student Home Page"),
        ),
      ),
    );
  }
}
