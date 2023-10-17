
import 'package:flutter/material.dart';
import 'package:project/reg.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
     Image.asset(
      'assets\image\list.png');;
    return Scaffold(
      body: Center(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/list.png', // Corrected the path to use forward slashes
              height: 200, // You can adjust the size as per your requirement
              width: 200,
        
            ),
            SizedBox(height: 100),
                      ElevatedButton(
              child: const Text('User'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 19, 102), // This sets the background color
                         ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationPage()),
                );
              },
            ),
             SizedBox(height: 10), // This w
            ElevatedButton(
              child: const Text('Admin'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 19, 102), // This sets the background color
                         ),
              onPressed: () {
                // Navigate to Admin page (you can add this later)
              },
            
            ),
             
          ],
          
        ),
      ),
    );
  }
}