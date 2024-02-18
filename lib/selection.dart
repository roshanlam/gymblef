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
                    imagePath: '../gibel_assets/lifting.png',
                    buttonText: 'Powerlifting',
                    onPressed: () {
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/bodybuilding.png',
                    buttonText: 'Bodybuilding',
                    onPressed: () {
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/cardio.png',
                    buttonText: 'Cardio',
                    onPressed: () {
                      // Add functionality for the third selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/casual.png',
                    buttonText: 'Casual',
                    onPressed: () {
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
                    imagePath: '../gibel_assets/profile.png',
                    buttonText: 'Newbie',
                    onPressed: () {
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/beginner.png',
                    buttonText: 'Beginner',
                    onPressed: () {
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/intermediate.png',
                    buttonText: 'Intermediate',
                    onPressed: () {
                      // Add functionality for the third selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/advanced.png',
                    buttonText: 'Advanced',
                    onPressed: () {
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
                    imagePath: '../gibel_assets/wheat.png',
                    buttonText: 'Cutting',
                    onPressed: () {
                      // Add functionality for the first selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/fruit_bowl.png',
                    buttonText: 'Stable',
                    onPressed: () {
                      // Add functionality for the second selection
                    },
                  ),
                  FocusButton(
                    imagePath: '../gibel_assets/burger.png',
                    buttonText: 'Bulking',
                    onPressed: () {
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
  final String buttonText;
  final VoidCallback? onPressed;

  const FocusButton({
    required this.imagePath,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 100,
            height: 100,
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
          buttonText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
