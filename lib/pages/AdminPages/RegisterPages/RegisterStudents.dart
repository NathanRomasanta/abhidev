import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStudents extends StatefulWidget {
  const RegisterStudents({Key? key}) : super(key: key);

  @override
  State<RegisterStudents> createState() => _RegisterStudentsState();
}

class _RegisterStudentsState extends State<RegisterStudents> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final uidController = TextEditingController();
  String? dropdownCallback;


  @override
  void dispose()  {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    uidController.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formkey,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('images/RegisterBKG.png'), fit: BoxFit.fill)
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent,

            body: Stack(
              children: [
                Container(padding: const EdgeInsets.only(left: 35, top:90),
                  child: const Text("Register\nStudents", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 45
                  ), ),),

                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.3,
                      right: 40, left: 40),

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(

                          controller: firstnameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(

                              labelText: "First Name",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ),
                        const SizedBox(height: 25,),
                        TextFormField(

                          controller: lastnameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(

                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ),
                        const SizedBox(height: 25,),
                        TextFormField(

                          controller: uidController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(

                              labelText: "UID",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ),

                        const SizedBox(height: 25,),
                        TextFormField(

                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(

                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ),

                        const SizedBox(height: 25,),
                        TextFormField(

                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(

                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ),

                        const SizedBox(height: 25,),
                        DropdownButton(
                          value: dropdownCallback,
                          items: const [
                            DropdownMenuItem(value: "MOAUC",child: Text("MOA")),
                            DropdownMenuItem(value: "PHA",child: Text("Pharmacy Assistant")),
                            DropdownMenuItem(value: "Accounting&Payroll",child: Text("Accounting & Payroll")),
                            DropdownMenuItem(value: "BA",child: Text("Business Administration")),
                            DropdownMenuItem(value: "MT1",child: Text("Massage Therapy Year 1")),
                            DropdownMenuItem(value: "MT2",child: Text("Massage Therapy Year 2")),
                            DropdownMenuItem(value: "CSW",child: Text("CSW")),
                            DropdownMenuItem(value: "EA",child: Text("Education Assistant")),

                          ], onChanged: (val){
                          setState(() {
                            dropdownCallback = val as String;
                          });
                        },
                        ),

                        const SizedBox(height: 75,),


                        ElevatedButton(
                          onPressed: () {
                            if(emailController.text.isEmpty && passwordController.text.isEmpty){
                              showDialog(context: context,
                                  builder: (context) => AlertDialog(title:
                                  const Text("Empty fields"),
                                    content: const Text("Your Fields are empty, please try again"),
                                    actions: [

                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: const Text("Ok")),
                                    ],
                                  ));
                            }else if (dropdownCallback == "MOAUC"){
                              RegisterMOAStudent();
                            }
                            {
                              Register();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              backgroundColor: Colors.white, // Will work,
                              fixedSize: const Size(240, 80)),
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future RegisterMOAStudent() async {
    String Fname = firstnameController.text.trim();
    String Lname = lastnameController.text.trim();
    String Elecmail = emailController.text.trim();
    String SUID = uidController.text.trim();


    FirebaseApp app = await Firebase.initializeApp(name: 'Accounts', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      //Adding Student to Accounts Folder
      await FirebaseFirestore.instance.collection("Accounts").doc(emailController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "Password" : passwordController.text.trim(),
        "Admin" : false,
        "Instructors" : false,
        "Course" : "MOAUC",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("MOAUC").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "IMOA02" : 0,
        "COM01" : 0,
        "ACC03" : 0,
        "MT05" : 0,
        "MOP06" : 0,
        "ASP07" : 0,
        "MBSP08" : 0,
        "CSP09" : 0,
        "JOB10" : 0,
        "PRAC11" : 0,

      });
      await app.delete();
      Navigator.pop(context);
      return Future.sync(() => userCredential);

    }
    on FirebaseAuthException catch (e) {
      showDialog(context: context,
          builder: (context) => AlertDialog(title:
          Text("Register User"),
            content: Text("Error Creating User $e"),
            actions: [

              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok")),
            ],
          ));
    }
    showDialog(context: context,
        builder: (context) => AlertDialog(title:
        Text("Register User"),
          content: Text("Successfully Added User to the Database"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

  }


  Future Register() async {

    String Fname = firstnameController.text.trim();
    String Lname = lastnameController.text.trim();
    String Elecmail = emailController.text.trim();

    Navigator.pop(context);
    showDialog(context: context,
        builder: (context) => AlertDialog(title:
        Text("Register User"),
          content: Text("Successfully Added User to the Database"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));
    FirebaseApp app = await Firebase.initializeApp(name: 'Accounts', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      await FirebaseFirestore.instance.collection("Accounts").doc(emailController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,

        "Password" : passwordController.text.trim(),
        "Admin" : false,
        "Instructors" : false,
      });

      await app.delete();
      return Future.sync(() => userCredential);

    }
    on FirebaseAuthException catch (e) {
      showDialog(context: context,
          builder: (context) => AlertDialog(title:
          Text("Register User"),
            content: Text("Error Creating User $e"),
            actions: [

              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok")),
            ],
          ));
    }
  }
}
