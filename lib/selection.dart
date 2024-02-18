import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  List<String> selectedSingleFocus = [];
  List<String> selectedSingleLevel = [];
  List<String> selectedSingleNutritionGoal = [];
  List<String> selectedMultipleFocus = [];
  List<String> selectedMultipleLevel = [];
  List<String> selectedMultipleNutritionGoal = [];

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
              buildSingleSelectionRow(
                label: 'What is your focus?',
                options: [
                  'Powerlifting',
                  'Bodybuilding',
                  'Cardio',
                  'Casual',
                ],
                selected: selectedSingleFocus.isNotEmpty ? [selectedSingleFocus.last] : [],
                onPressed: (label) {
                  setState(() {
                    selectedSingleFocus = [label];
                    print('Selected focus: $selectedSingleFocus');
                    // Add functionality for the selection
                  });
                },
              ),
              buildSingleSelectionRow(
                label: 'What is your level?',
                options: [
                  'Newbie',
                  'Beginner',
                  'Intermediate',
                  'Advanced',
                ],
                selected: selectedSingleLevel.isNotEmpty ? [selectedSingleLevel.last] : [],
                onPressed: (label) {
                  setState(() {
                    selectedSingleLevel = [label];
                    print('Selected level: $selectedSingleLevel');
                    // Add functionality for the selection
                  });
                },
              ),
              buildSingleSelectionRow(
                label: 'What are your nutrition goals?',
                options: [
                  'Cutting',
                  'Stable',
                  'Bulking',
                ],
                selected: selectedSingleNutritionGoal.isNotEmpty ? [selectedSingleNutritionGoal.last] : [],
                onPressed: (label) {
                  setState(() {
                    selectedSingleNutritionGoal = [label];
                    print('Selected nutrition goal: $selectedSingleNutritionGoal');
                    // Add functionality for the selection
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildMultipleSelectionRow(
                label: 'Select multiple focuses:',
                options: [
                  'Powerlifting',
                  'Bodybuilding',
                  'Cardio',
                  'Casual',
                ],
                selected: selectedMultipleFocus,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedMultipleFocus);
                    print('Selected focuses: $selectedMultipleFocus');
                    // Add functionality for the selection
                  });
                },
              ),
              buildMultipleSelectionRow(
                label: 'Select multiple levels:',
                options: [
                  'Newbie',
                  'Beginner',
                  'Intermediate',
                  'Advanced',
                ],
                selected: selectedMultipleLevel,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedMultipleLevel);
                    print('Selected levels: $selectedMultipleLevel');
                    // Add functionality for the selection
                  });
                },
              ),
              buildMultipleSelectionRow(
                label: 'Select multiple nutrition goals:',
                options: [
                  'Cutting',
                  'Stable',
                  'Bulking',
                ],
                selected: selectedMultipleNutritionGoal,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedMultipleNutritionGoal);
                    print('Selected nutrition goals: $selectedMultipleNutritionGoal');
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

  Widget buildSingleSelectionRow({
    required String label,
    required List<String> options,
    required List<String> selected,
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
            bool isSelected = selected.contains(option);
            String lowerOption = option.toLowerCase();
            return FocusButton(
              imagePath: '../gimbel_assets/$lowerOption.png',
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

  Widget buildMultipleSelectionRow({
    required String label,
    required List<String> options,
    required List<String> selected,
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
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: options.map((option) {
            bool isSelected = selected.contains(option);
            String lowerOption = option.toLowerCase();
            return FocusButton(
              imagePath: '../gimbel_assets/$lowerOption.png',
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

  void toggleSelection(String label, List<String> selectedList) {
    if (selectedList.contains(label)) {
      selectedList.remove(label);
    } else {
      selectedList.add(label);
    }
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
