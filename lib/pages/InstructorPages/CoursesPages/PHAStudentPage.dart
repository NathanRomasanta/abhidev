// ignore_for_file: empty_constructor_bodies

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../StudentInfo.dart';


class PHAStudentPage extends StatefulWidget {
  const PHAStudentPage({Key? key}) : super(key: key);

  @override
  State<PHAStudentPage> createState() => _PHAStudentPageState();
}

class _PHAStudentPageState extends State<PHAStudentPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Accounting&Payroll").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Text('Error');
            }


            switch (snapshot.connectionState){
              case ConnectionState.waiting: return const SpinKitFoldingCube(
                size: 140,
                color: Colors.white,
              );
              default:
                return
                    ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index){
                          var data = snapshot.data!.docs[index].data();


                          return Card(
                            child: ListTile(

                              onTap: (){
                                Navigator.push(context, PageTransition(
                                    child: const StudentInfo(),
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 500)));
                              },
                              title: Text(data['FirstName']),
                              subtitle: Text(data['Email']),
                            ),
                          );

                        });
            }
          });

  }
}

class DetailPage extends StatefulWidget {

  final DocumentSnapshot details;

  DetailPage({required this.details});


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
          title: Text("SS"),
        ),
      ),
    );
  }
}



