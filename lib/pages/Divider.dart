import 'package:flutter/material.dart';



class Divider extends StatefulWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  State<Divider> createState() => _DividerState();
}

class _DividerState extends State<Divider> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Text("Divder"),);
  }
}
