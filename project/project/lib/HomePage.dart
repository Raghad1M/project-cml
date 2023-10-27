import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'course_Enrollment.dart';
import 'course.dart';
import 'course_Enrollment.dart'; 
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    NewWidget(),
    Text('Profile Page Content'),
    CourseCatalog(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Courses',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  List<Course> enrolledCourses = [];

  @override
  void initState() {
    super.initState();
    _loadEnrolledCourses();
  }

_loadEnrolledCourses() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    if (userId != null) {
      var courseIds = await Enrollment.fetchEnrolledCoursesForUser(userId);
      for (var courseId in courseIds) {
        var courseDoc = await FirebaseFirestore.instance.collection('courses').doc(courseId).get();
        enrolledCourses.add(Course(id: courseDoc.id, name: courseDoc['name']));
      }
      setState(() {});
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),
      body: ListView.builder(
        itemCount: enrolledCourses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(enrolledCourses[index].name),
            onTap: () {
              // Navigate to the course page for the tapped course
            },
          );
        },
      ),
    );
  }
}
class CourseCatalog extends StatefulWidget {
  @override
  _CourseCatalogState createState() => _CourseCatalogState();
}

class _CourseCatalogState extends State<CourseCatalog> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  _loadCourses() async {
    var fetchedCourses = await Course.fetchAllFromFirestore();
    setState(() {
      courses = fetchedCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Catalog'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index].name),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnrollmentPage(course: courses[index]),
                  ),
                );
              },
              child: Text('Enroll'),
            ),
          );
        },
      ),
    );
  }
}