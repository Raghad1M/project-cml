import 'package:flutter/material.dart';

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
    Text('Courses Catalog Page Content'),
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

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'My Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Algorithms design'),
              onTap: () {
                // Navigate to the Algorithms design course page
              },
            ),
            Image.asset('assets/images/course-img2.png', width: 500, height: 200),
            ListTile(
              title: const Text('Software Engineering'),
              onTap: () {
                // Navigate to the Web development course page
              },
            ),
            Image.asset('assets/images/course-img3.png', width: 500, height: 200),
            // Add similar ListTiles and Images for other courses
          ],
        ),
      ),
    );
  }
}
