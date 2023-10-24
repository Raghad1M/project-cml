import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Enrollment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EnrollmentPage(),
    );
  }
}

class EnrollmentPage extends StatefulWidget {
  @override
  _EnrollmentPageState createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  String selectedCourse;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Enrollment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: selectedCourse,
              onChanged: (newValue) {
                setState(() {
                  selectedCourse = newValue;
                });
              },
              items: <String>['Course A', 'Course B', 'Course C', 'Course D']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select a Course',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic to handle form submission here
                  print('Name: ${nameController.text}');
                  print('Email: ${emailController.text}');
                  print('Course: $selectedCourse');
                },
                child: Text('Enroll'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}