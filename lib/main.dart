import 'package:firebase_core/firebase_core.dart';
import 'package:womansafety/Location.dart';
import 'package:flutter/material.dart';
import 'package:womansafety/profile.dart';
import 'package:womansafety/setting.dart';
import 'Dashboard.dart';
import 'SplashScreen.dart';
import 'aboutus.dart';
import 'contacts.dart';
import 'feedback.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );

  }
}
