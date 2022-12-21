
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/Models.dart';
import '../StudentInfo.dart';


class PHAStudentPage extends StatefulWidget {
  const PHAStudentPage({Key? key}) : super(key: key);

  @override
  State<PHAStudentPage> createState() => _PHAStudentPageState();
}

class _PHAStudentPageState extends State<PHAStudentPage> {

  List _students =[
    {

    }
  ];

 Future fetchStudents() async {
      var firestore = FirebaseFirestore.instance;
      QuerySnapshot qn = await firestore.collection("Accounting&Payroll").get();
      return qn.docs;
  }


  @override
  Widget build(BuildContext context) {
    return Container();

  }
}

class DetailPage extends StatefulWidget {

  final DocumentSnapshot details;
  const DetailPage({required this.details});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:

      Card(
        child: ListTile(
          title: Text(widget.details["FirstName"]),
        ),
      ),
    );
  }
}



