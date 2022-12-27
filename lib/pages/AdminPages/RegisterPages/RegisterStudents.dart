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
                        //First Name Field
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
                        //Last Name Field
                        TextFormField(
                          controller: lastnameController,
                          keyboardType: TextInputType.name,
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
                        //UID Field
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
                        //Password Field
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
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
                        //Courses
                        DropdownButton(
                          value: dropdownCallback,
                          items: const [
                            DropdownMenuItem(value: "A&P",child: Text("Accounting & Payroll")),
                            DropdownMenuItem(value: "BA",child: Text("Business Administration")),
                            DropdownMenuItem(value: "CSW",child: Text("CSW")),
                            DropdownMenuItem(value: "EA",child: Text("Education Assistant")),
                            DropdownMenuItem(value: "MT",child: Text("Massage Therapy")),
                            DropdownMenuItem(value: "MOAUC",child: Text("MOA")),
                            DropdownMenuItem(value: "PHA",child: Text("Pharmacy Assistant")),

                          ], onChanged: (val){
                          setState(() {
                            dropdownCallback = val as String;
                          });
                        },
                        ),
                        const SizedBox(height: 75,),
                        //Register Button
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
                            }
                            else if (dropdownCallback == "A&P"){
                              RegisterAccountingStudent();
                            }
                            else if (dropdownCallback == "BA")
                            {
                              RegisterBusinessAdStudent();
                            }
                            else if (dropdownCallback == "CSW")
                            {
                              RegisterCSWStudent();
                            }
                            else if (dropdownCallback == "EA")
                            {
                              RegisterEAStudent();
                            }
                            else if (dropdownCallback == "MT")
                            {
                              RegisterMTStudent();
                            }
                            else if (dropdownCallback == "MOAUC")
                            {
                              RegisterMOAStudent();
                            }
                            else if (dropdownCallback == "PHA")
                            {
                              RegisterPharmacyStudent();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              backgroundColor: Colors.white, // Will work,
                              fixedSize: const Size(240, 80)),
                          child: Text(
                            "Register",
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

  //Courses Register
  Future RegisterAccountingStudent() async {
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
        "Course" : "Accounting&Payroll",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("Accounting&Payroll").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "AP01" : 0,
        "AP02" : 0,
        "AP03" : 0,
        "AP04" : 0,
        "AP05" : 0,
        "AP06" : 0,
        "AP07" : 0,
        "AP08" : 0,
        "AP09" : 0,
        "AP10" : 0,
        "AP11" : 0,
        "AP12" : 0,

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
          content: Text("Successfully Created Accounting & Payroll Student"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

  }

  Future RegisterBusinessAdStudent() async {
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
        "Course" : "BusinessAdministration",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("BusinessAdministration").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "BSAD01" : 0,
        "BSAD02" : 0,
        "BSAD03" : 0,
        "BSAD04" : 0,
        "BSAD05" : 0,
        "BSAD06" : 0,
        "BSAD07" : 0,
        "BSAD08" : 0,
        "BSAD09" : 0,
        "BSAD10" : 0,
        "BSAD11" : 0,
        "BSAD12" : 0,
        "BSAD13" : 0,
        "BSAD14" : 0,

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
        const Text("Register User"),
          content: const Text("Successfully Created Business Administration Student"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Ok")),
          ],
        ));

  }

  Future RegisterCSWStudent() async {
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
        "Course" : "CSW",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("CSW").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "CSW01" : 0,
        "CSW02" : 0,
        "CSW03" : 0,
        "CSW04" : 0,
        "CSW05" : 0,
        "CSW06" : 0,
        "CSW07" : 0,
        "CSW08" : 0,
        "CSW09" : 0,
        "CSW10" : 0,
        "CSW11" : 0,
        "CSW12" : 0,
        "CSW13" : 0,
        "CSW14" : 0,
        "CSW15" : 0,
        "CSW16" : 0,
        "CSW17" : 0,
        "CSW18" : 0,
        "CSW19" : 0,
        "CSW20" : 0,
        "CSW21" : 0,

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
          content: Text("Successfully Created Community Support Worker Student"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

  }

  Future RegisterEAStudent() async {
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
        "Course" : "Pharmacy_Assistant",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("EducationAssistant").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "ED01" : 0,
        "ED02" : 0,
        "ED03" : 0,
        "ED04" : 0,
        "ED05" : 0,
        "ED06" : 0,
        "ED07" : 0,
        "ED08" : 0,
        "ED09" : 0,
        "ED10" : 0,
        "ED11" : 0,

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
          content: Text("Successfully Created Education Assistant Student"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

  }

  Future RegisterMTStudent() async {
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
        "Course" : "Pharmacy_Assistant",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("MassageTherapy").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "MT01" : 0,
        "MT02" : 0,
        "MT03" : 0,
        "MT04" : 0,
        "MT05" : 0,
        "MT06" : 0,
        "MT07" : 0,
        "MT08" : 0,
        "MT09" : 0,
        "MT10" : 0,
        "MT11" : 0,
        "MT12" : 0,
        "MTD13" : 0,
        "MT14" : 0,
        "MT15" : 0,
        "MT16" : 0,
        "MT17" : 0,
        "MT18" : 0,
        "MT19" : 0,
        "MT20" : 0,
        "MT21" : 0,
        "MT22" : 0,
        "MT23" : 0,

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
          content: Text("Successfully Created Massage Therapy Student"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

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

  Future RegisterPharmacyStudent() async {
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
        "Course" : "Pharmacy_Assistant",

        //Adding Student to Course Folder
      });
      await FirebaseFirestore.instance.collection("Pharmacy").doc(uidController.text.trim()).set({
        "FirstName" : Fname,
        "LastName" : Lname,
        "Email" : Elecmail,
        "UID" : SUID,
        "FinalGrade" : 0,
        "PH101" : 0,
        "PH102" : 0,
        "PH103" : 0,
        "PH104" : 0,
        "PH105" : 0,
        "PH106" : 0,
        "PH107" : 0,
        "PH108" : 0,
        "PH109" : 0,
        "PH110" : 0,
        "PH111" : 0,
        "PH112" : 0,
        "PH113" : 0,
        "PH114" : 0,

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
          content: Text("Successfully Created Pharmacy Assistant Student"),
          actions: [

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok")),
          ],
        ));

  }


  //Normal Register
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
