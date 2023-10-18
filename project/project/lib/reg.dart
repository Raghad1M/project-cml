import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _name;
 final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration'), backgroundColor:Color.fromARGB(255, 18, 19, 102)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value)  {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                  },

                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                
                validator: (value)  {
                  if (value == null) {
                    return 'Enter name please!';
                  }
                  return null;
                  },

                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
               return 'Password must be at least 6 characters!';
                 }
                 return null;
                      },

                onSaved: (value) {
                  _password = value;
                },
              ),
               TextFormField(
                decoration: InputDecoration(labelText: 'verify password'),
                obscureText: true,
                validator: (value) {
                if (value != passwordController.text) {
               return 'Passwords must be the same!';
                 }
                 return null;
                      },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Register'),
                 style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 18, 19, 102), // This sets the background color
                         ),
                onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                   try {
                      // Create the user
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: _email!,
                        password: _password!,
                      );

                      // Save additional user data in Firestore
                      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                        'email': _email,
                        'name': _name,
                        'subscribed':false,
                      });
                      Navigator.pop(context); // Return to previous screen after successful registration
                    } catch (error) {
                      print(error);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error registering user.'))


                      );
                    }
                  }
                },
              ),
              TextButton(
                child: Text('Already have an account? Login'),
    
                onPressed: () {
                  // Navigate to login page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
