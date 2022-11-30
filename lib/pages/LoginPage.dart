import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  late String _email, _password;

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
                  validator: (input) {
                    if(input!.isEmpty){
                      return "Please Type your Email";

                    }
                  },
                  onSaved: (input)=> _email = input!,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black54))),
                ),
                const SizedBox(height: 70),
                TextFormField(
                  validator: (input) {
                    if(input!.isEmpty){
                      return "Please Type your Password";

                    }
                  },
                  onSaved: (input)=> _password = input!,

                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)), backgroundColor: Colors.blue,
                      fixedSize: const Size(240, 80)),
                  child: Text(
                    "Login",
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


  void signIn() async {
    final formState = _formkey.currentState;
    if(formState!.validate()){
      formState.save();
      try {
        User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as User;
      }catch(e){
        print('caught error: $e');
      }
    }
  }
}
