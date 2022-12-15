//Cleaned
import 'package:abhidev/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose()  {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('images/LoginBKG.png'), fit: BoxFit.fill)
      ),


      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Stack(
          children: [
            Container(padding: const EdgeInsets.only(left: 35, top: 200),
            child: const Text("Welcome\nBack", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 45
            ), ),),

            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.5,
              right: 40, left: 40),

              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    
                    const SizedBox(height: 40,),
                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),

                    const SizedBox(height: 70,),

                ElevatedButton(
                  onPressed: () {
                   if(emailController.text.isEmpty && passwordController.text.isEmpty){
                     showDialog(context: context,
                         builder: (context) => AlertDialog(title:
                         const Text("Empty fields"),
                           content: Text("Your Fields are empty, please try again"),
                           actions: [

                             TextButton(onPressed: (){
                               Navigator.pop(context);
                             }, child: const Text("Ok")),
                           ],
                         ));
                   }else
                     {
                       login();
                     }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      backgroundColor: const Color(0xFF3b85fd), // Will work,
                      fixedSize: const Size(240, 80)),
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
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
    );
  }

  //Login Function
  Future login() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const SpinKitFoldingCube(
          size: 140,
          color: Colors.white,
        ));
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim());
  }
  on FirebaseAuthException catch (e) {
   Fluttertoast.showToast(msg: e.message.toString(),gravity: ToastGravity.TOP );
  }
   navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }

}
