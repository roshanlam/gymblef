import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  List<String> selectedSingleFocus = [];
  List<String> selectedSingleLevel = [];
  List<String> selectedSingleNutritionGoal = [];
  List<String> selectedTargetFocus = [];
  List<String> selectedTargetLevel = [];
  List<String> selectedTargetNutritionGoal = [];
  final _storage = FlutterSecureStorage();

  bool canProceedToNextPage() {
    return selectedSingleFocus.isNotEmpty &&
        selectedSingleLevel.isNotEmpty &&
        selectedSingleNutritionGoal.isNotEmpty &&
        selectedTargetFocus.isNotEmpty &&
        selectedTargetLevel.isNotEmpty &&
        selectedTargetNutritionGoal.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6C0C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 16.0),
              buildSingleSelectionRow(
                label: 'What is your focus?',
                options: [
                  'Powerlifting',
                  'Bodybuilding',
                  'Cardio',
                  'Casual',
                ],
                selected: selectedSingleFocus.isNotEmpty
                    ? [selectedSingleFocus.last]
                    : [],
                onPressed: (label) {
                  setState(() async {
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
                selected: selectedSingleLevel.isNotEmpty
                    ? [selectedSingleLevel.last]
                    : [],
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
                selected: selectedSingleNutritionGoal.isNotEmpty
                    ? [selectedSingleNutritionGoal.last]
                    : [],
                onPressed: (label) {
                  setState(() {
                    selectedSingleNutritionGoal = [label];
                    print(
                        'Selected nutrition goal: $selectedSingleNutritionGoal');
                    // Add functionality for the selection
                  });
                },
              ),

              // Target
              const SizedBox(height: 16.0),
              buildTargetSelectionRow(
                label: 'Select Target focuses:',
                options: [
                  'Powerlifting',
                  'Bodybuilding',
                  'Cardio',
                  'Casual',
                ],
                selected: selectedTargetFocus,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedTargetFocus);
                    print('Selected focuses: $selectedTargetFocus');
                    // Add functionality for the selection
                  });
                },
              ),
              buildTargetSelectionRow(
                label: 'Select Target levels:',
                options: [
                  'Newbie',
                  'Beginner',
                  'Intermediate',
                  'Advanced',
                ],
                selected: selectedTargetLevel,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedTargetLevel);
                    print('Selected levels: $selectedTargetLevel');
                    // Add functionality for the selection
                  });
                },
              ),
              buildTargetSelectionRow(
                label: 'Select Target nutrition goals:',
                options: [
                  'Cutting',
                  'Stable',
                  'Bulking',
                ],
                selected: selectedTargetNutritionGoal,
                onPressed: (label) {
                  setState(() {
                    toggleSelection(label, selectedTargetNutritionGoal);
                    print(
                        'Selected nutrition goals: $selectedTargetNutritionGoal');
                    // Add functionality for the selection
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: canProceedToNextPage()
                    ? () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NamePage()),
                        );*/
                      }
                    : null,
                child: const Text('Go to Home Page'),
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            bool isSelected = selected.contains(option);
            String lowerOption = option.toLowerCase();
            return FocusButton(
              imagePath: 'gimbel_assets/$lowerOption.png',
              label: option,
              onPressed: (label) {
                onPressed(label);
              },
              isSelected: isSelected,
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget buildTargetSelectionRow({
    required String label,
    required List<String> options,
    required List<String> selected,
    required Function(String) onPressed,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            bool isSelected = selected.contains(option);
            String lowerOption = option.toLowerCase();
            return FocusButton(
              imagePath: 'gimbel_assets/$lowerOption.png',
              label: option,
              onPressed: (label) {
                onPressed(label);
              },
              isSelected: isSelected,
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
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
    super.key,
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
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
