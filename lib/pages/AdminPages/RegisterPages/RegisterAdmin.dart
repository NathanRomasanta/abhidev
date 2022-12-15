import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({Key? key}) : super(key: key);

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  void dispose()  {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: firstnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "First Name",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: lastnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "Last Name",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54))),
                  ),

                  const SizedBox(height: 70),

                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Register();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(240, 80)),
                    child: Text(
                      "Register Admin Account",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future Register() async {
    String Fname = firstnameController.text.trim();
    String Lname = lastnameController.text.trim();
    String Elecmail = emailController.text.trim();

    FirebaseApp app = await Firebase.initializeApp(name: 'Accounts', options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      FirebaseFirestore.instance.collection("Accounts").doc(emailController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "Password" : passwordController.text.trim(),
        "Admin" : true,
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
    Navigator.pop(context);
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




  }
}
