import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/chooserule.dart';
import 'firebase_options.dart';
import 'course.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
  _addInitialCourses();
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
_addInitialCourses() async {
  List<String> courseNames = ['Data Structures', 'Machine Learning', 'Web Development'];
  for (var name in courseNames) {
    Course course = Course(id: DateTime.now().toIso8601String(), name: name);
    await course.addToFirestore();
  }
}

