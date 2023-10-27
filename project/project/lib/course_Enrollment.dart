import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database_service.dart';

class EnrollmentPage extends StatefulWidget {
  final Course course;
  
  EnrollmentPage({required this.course});
  @override
  _EnrollmentPageState createState() => _EnrollmentPageState();


}

class _EnrollmentPageState extends State<EnrollmentPage> {
  @override
  Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Structures'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
         backgroundColor: Color.fromARGB(255, 18, 19, 102), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/course-img1.png', fit: BoxFit.cover, height: 150,width: 200,), ),
            SizedBox(height: 20),
            Text(
              'Data Structures',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Embark on a hands-on journey with our Data Structures course, ...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.ondemand_video , size: 50),
                    Text('22'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.article , size: 50),
                    Text('10'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.quiz , size: 50),
                    Text('3'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.assignment, size: 50),
                    Text('9'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Intermediate Level',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Prerequisites:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('1- Introduction to Programming'),
            Text('2- Discrete Mathematics'),
            Text('3- Object oriented programming'),
            SizedBox(height: 30),
            Center(
              child: Center(
            child: ElevatedButton(
            onPressed: () async {
              if (userId != null) {
                await DatabaseService().enrollUserToCourse(userId, widget.course.id);
                
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
              );

              } else {
        
                print('No user is authenticated');
              }
            },
            child: Text('Enroll'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 18, 19, 102),
            ),
          ),

          ),
            ),
            
            SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                Text('Approximately 4 months to complete'),
                Text('Suggested 10 hours a week'),
             ],
            ),
            )
         ],
        ),
      ),
    );
  }
}
class Enrollment {
  final String userId;
  final String courseId;

  Enrollment({required this.userId, required this.courseId});

  static Future<List<String>> fetchEnrolledCoursesForUser(String userId) async {
    try {
      DocumentSnapshot userEnrollmentSnapshot = await FirebaseFirestore.instance.collection('userEnrollments').doc(userId).get();
      Map<String, dynamic> data = userEnrollmentSnapshot.data() as Map<String, dynamic>;
       List<String> courseIds = (data['enrolledCourses'] as List).map((item) => item.toString()).toList();

      return courseIds;
    } catch (e) {
      print("Error fetching enrollments: $e");
      return [];
    }
  }
}
