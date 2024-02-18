import 'package:flutter/material.dart';

void main() {
  runApp(FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

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
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Add authentication logic here
                // For now, let's print the entered email and password
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
              },
              style: ElevatedButton.styleFrom(
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
