import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomePage.dart';
import 'loginpage.dart';
import 'select_plan.dart';

class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _name = "";
  String _verifyPassword = "";
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
        backgroundColor: Color.fromARGB(255, 18, 19, 102), 
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Name cannot be empty' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email cannot be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
                onSaved: (value) => _password = value!,
                obscureText: true, 
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Verify Password'),
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) => _verifyPassword = value!,
                obscureText: true, 
              ),

              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 19, 102),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );

                      if (userCredential.user != null) {
                        await userCredential.user!.updateProfile(displayName: _name);
                        await userCredential.user!.reload();
                        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                          'email': _email,
                          'name': _name,
                          'subscribed': false,
                        });

                        Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (context) => PlanSelectionPage()),
                      );

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to register user.'))
                        );
                      }
                    } catch (error) {
                      print(error);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${error.toString()}'))
                      );
                    }
                  }
                },
              ),
              TextButton(
                child: Text('Already have an account? Login'),
    
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPageUser()),
                  );
            },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
