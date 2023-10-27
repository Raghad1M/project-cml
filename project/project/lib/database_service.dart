import 'package:cloud_firestore/cloud_firestore.dart';
import 'course.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> enrollUserToCourse(String userId, String courseId) async {
    final userEnrollmentsRef = FirebaseFirestore.instance.collection('userEnrollments').doc(userId);

    DocumentSnapshot userSnapshot = await userEnrollmentsRef.get();

    if (userSnapshot.exists) {
      // User exists, update their enrolledCourses array
      userEnrollmentsRef.update({
        'enrolledCourses': FieldValue.arrayUnion([courseId])
      });
    } else {
      // User doesn't exist, create a new document
      userEnrollmentsRef.set({
        'enrolledCourses': [courseId]
      });
    }
  }
  void addCourseToFirestore(Course course) async {
    _firestore.collection('courses').doc(course.id).set({
      'id': course.id,
      'name': course.name,
    });
  }}
