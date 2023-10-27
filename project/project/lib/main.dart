import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'chooserole.dart';
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
  var coursesCollection = FirebaseFirestore.instance.collection('courses');
  
  List<String> courseNames = ['Data Structures', 'Machine Learning', 'Web Development'];
  for (var name in courseNames) {
    // Check if course already exists
    var existingCourses = await coursesCollection.where('name', isEqualTo: name).get();
    
    if (existingCourses.docs.isEmpty) {
      // If the course doesn't exist, add it
      Course course = Course(id: DateTime.now().toIso8601String(), name: name);
      await course.addToFirestore();
    }
  }
}


