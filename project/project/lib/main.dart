import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/chooserule.dart';
import 'package:project/reg.dart';
import 'firebase_options.dart'; // Only if you have this file

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure you have widget bindings initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'choose acc type',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 5, 5, 92)),
      home: const ChooseRolePage(),
      
    );
  }
}


