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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                '../gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
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
                  // Add authentication logic here
                  // For now, let's print the entered email and password
                  print('Email: ${emailController.text}');
                  print('Password: ${passwordController.text}');
                },
                child: Text('Login', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
