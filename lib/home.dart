import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6C0C), // Orange background color
      ),
      body: ProductCard(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFF6C0C), // Orange background color
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white, // White card background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
          icon: Image.asset(
            'gimbel_assets/newbie.png', // Replace with your profile icon image path
            height: 30, // Adjust the height as needed
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
