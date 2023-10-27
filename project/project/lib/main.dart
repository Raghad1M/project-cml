import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/chooserule.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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


