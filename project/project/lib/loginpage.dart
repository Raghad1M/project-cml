import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'addCourse.dart';


class LoginPageUser extends StatefulWidget {
  @override
  _LoginPageStateUser createState() => _LoginPageStateUser();
}

class _LoginPageStateUser extends State<LoginPageUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      setState(() {
        _errorMessage = "No account is registered with this email or password is incorrect.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login Page'),
        backgroundColor: Color.fromARGB(255, 18, 19, 102),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              _errorMessage != null
                  ? Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 19, 102),
                ),
              ),
              // Optionally add sign-up and password recovery here
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

      void _login() async {
        String email = _emailController.text;
        String password = _passwordController.text;

        try {
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          
          DocumentSnapshot adminDoc = await FirebaseFirestore.instance.collection('admins').doc(userCredential.user!.uid).get();

          if (adminDoc.exists) {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AddCoursePage()));
          } else {
            print("No admin with this email"); // Debug print
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No admin with this email.'))
            );
          }
        } catch (e) {
          print("Error logging in: $e"); // Debug print
          ScaffoldMessenger.of(context).showSnackBar(
            
            SnackBar(content: Text('Login failed. Try logging in as a user instead.'))
          );
        }
      }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login Page'),
         backgroundColor: Color.fromARGB(255, 18, 19, 102),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Admin email'),
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
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 19, 102),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}