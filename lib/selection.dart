import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String lastSelectedFocus = '';
  String lastSelectedLevel = '';
  String lastSelectedNutritionGoal = '';

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
              buildFocusRow(
                label: 'What is your focus?',
                options: [
                  'Powerlifting',
                  'Bodybuilding',
                  'Cardio',
                  'Casual',
                ],
                lastSelected: lastSelectedFocus,
                onPressed: (label) {
                  setState(() {
                    lastSelectedFocus = label;
                    print('Selected focus: $label');
                    // Add functionality for the selection
                  });
                },
              ),
              buildFocusRow(
                label: 'What is your level?',
                options: [
                  'Newbie',
                  'Beginner',
                  'Intermediate',
                  'Advanced',
                ],
                lastSelected: lastSelectedLevel,
                onPressed: (label) {
                  setState(() {
                    lastSelectedLevel = label;
                    print('Selected level: $label');
                    // Add functionality for the selection
                  });
                },
              ),
              buildFocusRow(
                label: 'What are your nutrition goals?',
                options: [
                  'Cutting',
                  'Stable',
                  'Bulking',
                ],
                lastSelected: lastSelectedNutritionGoal,
                onPressed: (label) {
                  setState(() {
                    lastSelectedNutritionGoal = label;
                    print('Selected nutrition goal: $label');
                    // Add functionality for the selection
                  });
                },
              ),
              // Add more FocusButtons for additional selections as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFocusRow({
    required String label,
    required List<String> options,
    required String lastSelected,
    required Function(String) onPressed,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            bool isSelected = option.toLowerCase() == lastSelected.toLowerCase();
            return FocusButton(
              imagePath: '../gimbel_assets/$option.png',
              label: option,
              onPressed: (label) {
                onPressed(label);
              },
              isSelected: isSelected,
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

class FocusButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final Function(String)? onPressed;
  final bool isSelected;

  const FocusButton({
    required this.imagePath,
    required this.label,
    this.onPressed,
    required this.isSelected,
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.white,
                width: 2.0,
              ),
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
