import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String name = '';
  late String email = '';
  late String sex = '';
  late String focus = '';
  late String nutrition = '';
  late String level = '';


  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Fetch user data from secure storage
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      const  FlutterSecureStorage storage = FlutterSecureStorage();
      name = (await storage.read(key: 'Name')) ?? '';
      email = (await storage.read(key: 'email')) ?? '';
      print(email);
      var url = Uri.parse('http://159.203.142.48:8000/user/getUserInfo');
      var response = await http.get(url, headers: { 'email': email });
      var responseJSON = jsonDecode(response.body);

      print(responseJSON.toString());

      sex = responseJSON['sex'];
      focus = responseJSON['focus'];
      nutrition = responseJSON['nutrition'];
      level = responseJSON['level'];

      print('Name Test: $name');
      print('Sex Test: $sex');
    } catch (e) {
      // Handle error
      print('Error loading user data: $e');
    }
  }

  Future<void> _saveUserData() async {
    try {
      // Save user data if editing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved')),
      );
    } catch (e) {
      // Handle error
      print('Error saving user data: $e');
    }
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C0C),
        title: const Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditing) {
                _saveUserData();
              }
              _toggleEditing();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(name, 'Name'),
            _buildTextField(email, 'Email'),
            _buildTextField(sex, 'Sex'),
            _buildTextField(focus, 'Focus'),
            _buildTextField(nutrition, 'Nutrition'),
            _buildTextField(level, 'Level'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String value, String labelText) {
    return TextField(
      controller: TextEditingController(text: value),
      enabled: _isEditing, // Enable editing if isEditing is true
      decoration: InputDecoration(
        labelText: '$labelText: ${_isEditing ? '' : value}', // Show default value only if editing
      ),
      onChanged: (newValue) {
        // Update the value when editing
        setState(() {
          value = newValue;
        });
      },
    );
  }
}
