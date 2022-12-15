import 'package:flutter/material.dart';


class AdminLibraries extends StatefulWidget {
  const AdminLibraries({Key? key}) : super(key: key);

  @override
  State<AdminLibraries> createState() => _AdminLibrariesState();
}

class _AdminLibrariesState extends State<AdminLibraries> {
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
                      child: const Text("Libraries", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 45
                      ), ),),

                    Container(padding: const EdgeInsets.only(right:210, top: 50),
                      child: const Text("", style: TextStyle( color: Colors.black, fontSize: 20
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
