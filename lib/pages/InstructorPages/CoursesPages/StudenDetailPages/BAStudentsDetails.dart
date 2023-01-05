import 'package:abhidev/pages/InstructorPages/CoursesPages/Edit_Pages/BAEditGrades.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class BusAdStudentDetails extends StatelessWidget {
   BusAdStudentDetails(this.studentID, {Key? key}) : super(key: key){
     _reference = FirebaseFirestore.instance.collection("BusinessAdministration").doc(studentID);
     _futureData = _reference.get();

}

  String studentID;
  late DocumentReference _reference;
//_reference.get()  --> returns Future<DocumentSnapshot>
//_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Column(
              children: [
                Text('${data['FirstName']}'),
                Text('${data['LastName']}'),
                Text('${data['FinalGrade']}'),
                Text('${data['UID']}'),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BAEditGrades(studentID)));
                },
                    child: Text("EditGrades")),


              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}




