import 'package:flutter/material.dart';
import 'course.dart';
import 'database_service.dart';

class AddCoursePage extends StatefulWidget {
  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController _courseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new course',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _courseNameController,
              decoration: InputDecoration(
                hintText: 'Course name..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                // Create course using input from the text field
                Course newCourse = Course(
                  id: DateTime.now().millisecondsSinceEpoch.toString(), // This is just a unique ID based on the current time. Adjust accordingly.
                  name: _courseNameController.text,
                );
                await newCourse.addToFirestore();
                Navigator.pop(context); // Close the page after adding the course
              },
              icon: Icon(Icons.add),
              label: Text('Add Test Course'),
            ),
            // Add other buttons and features like 'Add course material', 'Add discussion board', etc.
          ],
        ),
      ),
    );
  }
}
