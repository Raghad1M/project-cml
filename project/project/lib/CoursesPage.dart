import 'package:flutter/material.dart'; 

void main() {
  runApp(CoursesCatalogApp());
}

class CoursesCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoursesCatalogPage(),
    );
  }
}

class CoursesCatalogPage extends StatefulWidget {
  @override
  _CoursesCatalogPageState createState() => _CoursesCatalogPageState();
}

class _CoursesCatalogPageState extends State<CoursesCatalogPage> {
  final List<String> myCurrentCourses = [
    'Data Structure',
    'Object Oriented Programming',
  ];

  final List<String> myAchievements = [
    'Discrete Mathematics: 90',
    'Object Oriented Programming: 95',
  ];

  final List<String> availableCourses = [
    'Data Structure',
    'Discrete Mathematics',
    'Object Oriented Programming',
  ];

  List<String> displayedCourses = [];

  void showMyCurrentCourses() {
    setState(() {
      displayedCourses = myCurrentCourses;
    });
  }

  void showMyAchievements() {
    setState(() {
      displayedCourses = myAchievements;
    });
  }

  void showAvailableCourses() {
    setState(() {
      displayedCourses = availableCourses;
    });
  }

  void returnToHomePage() {
    // Implement the logic to navigate back to the home page
  }

  @override
  void initState() {
    super.initState();
    // Initially show my current courses
    showMyCurrentCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses Catalog'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: showMyCurrentCourses,
                  child: Text('My Current Courses'),
                ),
                ElevatedButton(
                  onPressed: showMyAchievements,
                  child: Text('My Achievements'),
                ),
                ElevatedButton(
                  onPressed: showAvailableCourses,
                  child: Text('Available Courses'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(displayedCourses[index]),
                  onTap: () {
                    // Handle course selection
                    // You can navigate to a course details page or perform any other action here
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: returnToHomePage,
                child: Text('Return to Home Page'),
              ),
              ElevatedButton(
                onPressed: showAvailableCourses,
                child: Text('Available Courses'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle discussion board button press
                },
                child: Text('Discussion Board'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle "My Courses" button press
                },
                child: Text('My Courses'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
