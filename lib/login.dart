import 'package:flutter/material.dart';
import 'selection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6C0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '../gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 8.0),
              Text(
                'Find Your Fit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32.0),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // For simplicity, assume successful login
                  // You should replace this with your actual authentication logic
                  _signIn(context);
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // For simplicity, assume successful login
                  // You should replace this with your actual authentication logic
                  _signIn(context);
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://159.203.142.48:8000/auth/register');
    var response = await http.post(url, body: { 'email': email, 'password': password });

    var responseJSON = jsonDecode(response.body);
    bool isRegistrationSuccessful = responseJSON['success'];

    if (isRegistrationSuccessful) {
      final storage = FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: responseJSON['token']);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionPage()),
      );
    } else {
      // Handle unsuccessful registration
      // You can show an error message or take appropriate action
    }
  }

  void _signIn(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://159.203.142.48:8000/auth/login');
    var response = await http.post(url, body: { 'email': email, 'password': password });

    var responseJSON = jsonDecode(response.body);
    bool isSignInSuccessful = responseJSON['success'];

    if (isSignInSuccessful) {
      final storage = FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: responseJSON['token']);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionPage()),
      );
    } else {
      // Handle unsuccessful sign-in
      // You can show an error message or take appropriate action
    }
  }
}
