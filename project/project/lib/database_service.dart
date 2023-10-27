import 'package:cloud_firestore/cloud_firestore.dart';
import 'course.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  void addCourseToFirestore(Course course) async {
    _firestore.collection('courses').doc(course.id).set({
      'id': course.id,
      'name': course.name,
    });
  }

  void enrollUserToCourse(String userId, String courseId) async {
    // Here, you can add the logic to enroll a user to a course in Firestore.
    // Assuming you have a collection named 'enrollments' that keeps track of enrollments.
    _firestore.collection('enrollments').add({
      'userId': userId,
      'courseId': courseId,
    });
  }
}
