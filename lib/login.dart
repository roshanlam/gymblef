import 'package:flutter/material.dart';
import 'package:gymblef/components/popup.dart';
import 'name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6C0C),
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
                'gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Find Your Fit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // For simplicity, assume successful login
                  // You should replace this with your actual authentication logic
                  _register(context);
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // For simplicity, assume successful login
                  // You should replace this with your actual authentication logic
                  _signIn(context);
                },
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
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
    var response =
        await http.post(url, body: {'email': email, 'password': password});

    var responseJSON = jsonDecode(response.body);
    bool isRegistrationSuccessful = responseJSON['success'];

    if (isRegistrationSuccessful) {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: responseJSON['token']);
      await storage.write(key: 'email', value: email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NamePage()),
      );
    } else {
      showErrorDialog(
        context: context,
        errorMessage: 'Invalid email or password',
        title: 'Sign-up failed',
      );
    }
  }

  void _signIn(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://159.203.142.48:8000/auth/login');
    var response =
        await http.post(url, body: {'email': email, 'password': password});

    var responseJSON = jsonDecode(response.body);
    bool isSignInSuccessful = responseJSON['success'];

    if (isSignInSuccessful) {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'auth_token', value: responseJSON['token']);
      await storage.write(key: 'email', value: email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NamePage()),
      );
    } else {
      // Handle unsuccessful sign-in
      // You can show an error message or take appropriate action
      showErrorDialog(
        context: context,
        errorMessage: 'Invalid email or password',
        title: 'Sign-in failed',
      );
    }
  }
}
