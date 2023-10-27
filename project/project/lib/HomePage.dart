import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'courseMaterials.dart';
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
    ProfilePage(),
    CourseCatalog(enrolledCourses: [],),
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
   print("Loading enrolled courses...");

   try {
       final user = FirebaseAuth.instance.currentUser;
       final userId = user?.uid;

       if (userId != null) {
           print("Fetching enrolled courses for user: $userId");
           List<String> courseIds = await Enrollment.fetchEnrolledCoursesForUser(userId);
           
           if (courseIds.isNotEmpty) {
               print("User is enrolled in these courses: $courseIds");
               var coursesQuery = await FirebaseFirestore.instance.collection('courses').where(FieldPath.documentId, whereIn: courseIds).get();
               enrolledCourses = coursesQuery.docs.map((doc) => Course(id: doc.id, name: doc['name'])).toList();
               print("Fetched ${enrolledCourses.length} enrolled courses from Firestore");
               setState(() {});
           } else {
               print("User is not enrolled in any courses");
           }
       } else {
           print("User ID is null");
       }
   } catch (e) {
       print("Error loading enrolled courses: $e");
   }
}




 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),  
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),
      body: ListView.builder(
        itemCount: enrolledCourses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(enrolledCourses[index].name),
           onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseMaterialsPage(courseName: enrolledCourses[index].name),
              ),
            );
          },
          );
        },
      ),
    );
  }
}
class CourseCatalog extends StatefulWidget {
  final List<Course> enrolledCourses;
  
  CourseCatalog({required this.enrolledCourses});

  @override
  _CourseCatalogState createState() => _CourseCatalogState();
}

class _CourseCatalogState extends State<CourseCatalog> {
  List<Course> courses = [];

  @override
    void initState() {
    super.initState();
    _loadCourses();
    // Now you can use widget.enrolledCourses in this state
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
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
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
              child: Text('Enroll',),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 19, 102),
                ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit profile page or show a dialog to edit profile info
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,

                backgroundImage: AssetImage('assets/default_profile.png'),
              ),
            ),
            SizedBox(height: 16),
            Text('Name: ${user?.displayName ?? "Name not available"}'),
            SizedBox(height: 8),
            Text('Email: ${user?.email ?? "Email not available"}'),
            SizedBox(height: 24),
            Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // ... You can list out achievements here ...
          ],
        ),
      ),
    );
  }
}
