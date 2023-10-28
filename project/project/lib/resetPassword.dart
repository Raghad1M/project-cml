import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _resetPassword() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    String email = _emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        _errorMessage = "Password reset email sent.";
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
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
              _errorMessage != null
                  ? Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _resetPassword,
                child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Send Reset Email'),
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
