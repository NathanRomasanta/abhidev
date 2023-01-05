

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BAEditGrades extends StatelessWidget {
  BAEditGrades(this.studentID,{Key? key}) : super(key: key){
    _reference = FirebaseFirestore.instance.collection("BusinessAdministration").doc(studentID);
    _futureData = _reference.get();
  }
  String studentID;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late Map data;
  final finalGradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: 80,),
          TextFormField(

            controller: finalGradeController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(

                labelText: "Last Name",
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.black))),
          ),

          SizedBox(height: 80,),

          ElevatedButton(onPressed: () {
            EditGrades();
            Navigator.pop(context);

          }, child: Text("Make Changes"))
        ],
      ),
    );
  }



  Future EditGrades() async {
    int finalGrade = int.parse(finalGradeController.text.trim());
    try {
      await FirebaseFirestore.instance.collection("BusinessAdministration").doc(studentID).update({
        "FinalGrade" : finalGrade,
      });


    }
    on FirebaseAuthException catch (e) {
      print(e);
    }






  }
}
