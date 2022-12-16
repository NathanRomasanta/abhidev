import 'package:flutter/material.dart';


class MOAStudentsPage extends StatefulWidget {
  const MOAStudentsPage({Key? key}) : super(key: key);

  @override
  State<MOAStudentsPage> createState() => _MOAStudentsPageState();
}

class _MOAStudentsPageState extends State<MOAStudentsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("MOA Students"),
      ),
    );
  }
}
