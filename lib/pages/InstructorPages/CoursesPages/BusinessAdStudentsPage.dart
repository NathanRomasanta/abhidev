import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'StudenDetailPages/BusAdStudentsDetails.dart';


class BusinessAdStudentsPage extends StatelessWidget {
  BusinessAdStudentsPage({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference = FirebaseFirestore.instance.collection("Accounting&Payroll");
  late Stream<QuerySnapshot> _stream;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if(snapshot.hasError){
            return Center(child: Text("Some Error occurred ${snapshot.error}"),);
          }

          if(snapshot.hasData){
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            List<Map> students = documents.map((e) =>
            {
              'UID': e.id,
              'FirstName': e['FirstName'],
              'LastName': e['LastName'],
              'Email': e['Email'],


            }).toList();


            return ListView.builder(
                itemCount: students.length ,
                itemBuilder: (BuildContext context, int index) {

                  Map thisStudents = students[index];

                  return ListTile(
                    title: Text('${thisStudents['FirstName']}' + " " +'${thisStudents['LastName']}' ),
                    subtitle: Text('${thisStudents['UID']}'),
                    onTap: () {
                     Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BusAdStudentDetails(thisStudents['UID'] )));},
                  );
                },



            );


          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
