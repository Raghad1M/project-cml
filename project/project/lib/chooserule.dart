import 'package:flutter/material.dart';
import 'package:project/loginpage.dart';
import 'package:project/reg.dart';

import 'addCourse.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
     Image.asset(
      'assets\image\list.png');;
    return Scaffold(
      body: Center(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/list.png', 
              height: 200, 
              width: 200,
        
            ),
            SizedBox(height: 100),
                      ElevatedButton(
              child: const Text('User'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 19, 102), 
                         ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationPage()),
                );
              },
            ),
             SizedBox(height: 10), 
            ElevatedButton(
              child: const Text('Admin'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 19, 102), 
                         ),
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPageAdmin()),
                  );
              },
            
            ),
             
          ],
          
        ),
      ),
    );
  }
}