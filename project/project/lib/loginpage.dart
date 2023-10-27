import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';


class LoginPageUser extends StatefulWidget {
  @override
  _LoginPageStateUser createState() => _LoginPageStateUser();
}

class _LoginPageStateUser extends State<LoginPageUser> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
void _login() async {
  String email = _usernameController.text;
  String password = _passwordController.text;

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

  } catch (e) {
   "no account is registered with this email";
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageAdmin extends StatefulWidget {
  @override
  _LoginPageStateAdmin createState() => _LoginPageStateAdmin();
}

class _LoginPageStateAdmin extends State<LoginPageAdmin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

      void _login() async {
        String email = _usernameController.text;
        String password = _passwordController.text;

        try {
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          
          DocumentSnapshot adminDoc = await FirebaseFirestore.instance.collection('admins').doc(userCredential.user!.uid).get();

          if (adminDoc.exists) {
            // User is an admin. Navigate to the admin's main page or show a success message
          } else {
            "no admin with this email";
          }
        } catch (e) {
          "log in as a user instead";
        }
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Asmin Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}