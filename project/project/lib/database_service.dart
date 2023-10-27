import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference enrollments = FirebaseFirestore.instance.collection('enrollments');

  Future<void> enrollUserToCourse(String userId, String courseId) async {
    return enrollments
        .add({
          'userId': userId, 
          'courseId': courseId
        })
        .then((value) => print("User Enrolled"))
        .catchError((error) => print("Failed to enroll user: $error"));
  }
}
