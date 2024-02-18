import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6C0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                '../gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 16.0),
              Text(
                'What is your focus?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FocusButton(
                    imagePath: '../gimbel_assets/lifting.png',
                    label: 'Powerlifting',
                    onPressed: (label) {
                      print('Selected focus: $label.toLowerCase( )');
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/bodybuilding.png',
                    label: 'Bodybuilding',
                    onPressed: (label) {
                      print('Selected focus: $label.toLowerCase( )');
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/cardio.png',
                    label: 'Cardio',
                    onPressed: (label) {
                      print('Selected focus: $label.toLowerCase( )');
                      // Add functionality for the third selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/casual.png',
                    label: 'Casual',
                    onPressed: (label) {
                      print('Selected focus: $label.toLowerCase( )');
                      // Add functionality for the fourth selection
                    },
                  ),
                ],
              ),
              Text(
                'What is your level?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FocusButton(
                    imagePath: '../gimbel_assets/profile.png',
                    label: 'Newbie',
                    onPressed: (label) {
                      print('Selected level: $label.toLowerCase( )');
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/beginner.png',
                    label: 'Beginner',
                    onPressed: (label) {
                      print('Selected level: $label.toLowerCase( )');
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/intermediate.png',
                    label: 'Intermediate',
                    onPressed: (label) {
                      print('Selected level: $label.toLowerCase( )');
                      // Add functionality for the third selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/advanced.png',
                    label: 'Advanced',
                    onPressed: (label) {
                      print('Selected level: $label.toLowerCase( )');
                      // Add functionality for the fourth selection
                    },
                  ),
                ],
              ),
              Text(
                'What are your nutrition goals?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FocusButton(
                    imagePath: '../gimbel_assets/wheat.png',
                    label: 'Cutting',
                    onPressed: (label) {
                      print('Selected nutrition goal: $label.toLowerCase( )');
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/fruit_bowl.png',
                    label: 'Stable',
                    onPressed: (label) {
                      print('Selected nutrition goal: $label.toLowerCase( )');
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gimbel_assets/burger.png',
                    label: 'Bulking',
                    onPressed: (label) {
                      print('Selected nutrition goal: $label.toLowerCase( )');
                      // Add functionality for the third selection
                    },
                  ),
                ],
              ),
              // Add more FocusButtons for additional selections as needed
            ],
          ),
        ),
      ),
    );
  }
}

class FocusButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final Function(String)? onPressed;

  const FocusButton({
    required this.imagePath,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (onPressed != null) {
              onPressed!(label);
            }
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
