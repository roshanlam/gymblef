import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymblef/components/util.dart';
import 'profile.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

int currentIndex = 0;
dynamic getAllMatches() async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  var email = (await storage.read(key: 'email')) ?? '';

  var url = Uri.parse('http://159.203.142.48:8000/user/getBuddies');
  var response = await http.get(url, headers: { 'email': email });
  var responseJSON = jsonDecode(response.body);

  var matchingUsers = responseJSON['matchingUsers'];
  matchingUsers = matchingUsers.sort((a, b) => b.compatibility.compareTo(a.compatibility));
  matchingUsers = matchingUsers.map((user) => fetchUserInfo(user['email']));
  return matchingUsers;
}
dynamic getNextMatch() async {
  var matchingUsers = await getAllMatches();
  return matchingUsers[currentIndex++ % matchingUsers.length];
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6C0C), // Orange background color
      ),
      body: const ProductCard(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF6C0C), // Orange background color
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white, // White card background color
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontSize: 32.0, // Increase font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0), // Increase spacing
                  Text(
                    'Age: 25',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontSize: 32.0, // Increase font size
                    ),
                  ),
                  SizedBox(height: 12.0), // Increase spacing
                  Text(
                    'Location: City, Country',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontSize: 32.0, // Increase font size
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset(
                    'gimbel_assets/dislike.png', // Replace with your dislike image path
                    height: 60, // Adjust the height as needed
                  ),
                  onPressed: () {
                    // Handle dislike action
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    'gimbel_assets/like.png', // Replace with your like image path
                    height: 60, // Adjust the height as needed
                  ),
                  onPressed: () {
                    // Handle like action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            'gimbel_assets/home_button.png', // Replace with your home icon image path
            height: 30, // Adjust the height as needed
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'gimbel_assets/chat.png', // Replace with your message icon image path
            height: 30, // Adjust the height as needed
          ),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const ProfilePage(),
                ),
              );
            },
            child: Image.asset(
              'gimbel_assets/newbie.png', // Replace with your profile icon image path
              height: 30, // Adjust the height as needed
            ),
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
    );
  }
}
