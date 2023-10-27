import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String id;
  final String name;

  Course({required this.id, required this.name});

  Future<void> addToFirestore() async {
    await FirebaseFirestore.instance.collection('courses').doc(id).set({
      'id': id,
      'name': name,
    });
  }

  static Future<List<Course>> fetchAllFromFirestore() async {
    var coursesCollection = FirebaseFirestore.instance.collection('courses');
    var courseDocs = await coursesCollection.get();

    return courseDocs.docs.map((doc) {
      return Course(id: doc.id, name: doc['name']);
    }).toList();
  }
}