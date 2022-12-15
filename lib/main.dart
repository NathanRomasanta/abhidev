import 'package:abhidev/pages/StartupPages/Startup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();

  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'abhidev',
      theme: ThemeData(
       fontFamily: 'Product Sans',
      ),
      home: const Startup(),
    );
  }
}






