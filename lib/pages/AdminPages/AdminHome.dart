import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 400,
          height: 800,
          child: Container(
            child: Center(
              child: Stack(
                children: [
                  Container(padding: const EdgeInsets.only(right:210, bottom: 400),
                    child: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                    ), ),),

                  Container(padding: const EdgeInsets.only(right:210, top: 50),
                    child: const Text("Admin", style: TextStyle( color: Colors.black, fontSize: 20
                    ), ),),
                ],

              ),
            ),
          ),
        ),
      )
    );
  }
}
