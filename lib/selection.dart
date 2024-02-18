import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gymblef/components/util.dart';
import 'home.dart';

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
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await checkLoginToken();

    if (!isAuthenticated) {
      // Assuming you have a named route for the login page set up
      Navigator.of(context).pushReplacementNamed('/login');
    }
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
                    ? () async {
                        final storage = FlutterSecureStorage();

                        var data = {
                          // '_id': await storage.read(key: '_id'),
                          'email': await storage.read(key: 'email'),
                          'sex': await storage.read(key: 'selectedGender'),
                          // 'age_range': ,
                          'focus': selectedSingleFocus.last,
                          'nutrition': selectedSingleNutritionGoal.last,
                          'level': selectedSingleLevel.last,
                          // 'location': await storage.read(key: 'location'),
                          'targetUser': {
                            // 'sex': ,
                            // 'age_range': ,
                            'focus': selectedTargetFocus.last,
                            'nutrition': selectedTargetNutritionGoal.last,
                            'level': selectedTargetLevel.last,
                          }
                        };

                        String? email = data['email'].toString();
                        String? name = await storage.read(key: 'Name');
                        String? _id = await storage.read(key: '_id');
                        print('Email from storage: $email');
                        print('Name from storage: $name');
                        print('ID from storage: $_id');

                        print(jsonEncode(data));

                        var url =
                            Uri.parse('http://159.203.142.48:8000/UserInfo');
                        var response = await http.post(url, body: {
                          'email': await storage.read(key: 'email'),
                          'sex': await storage.read(key: 'selectedGender'),
                          // 'age_range': ,
                          'focus': selectedSingleFocus.last,
                          'nutrition': selectedSingleNutritionGoal.last,
                          'level': selectedSingleLevel.last,
                          // 'location': await storage.read(key: 'location'),
                          'targetUser': jsonEncode({
                            // 'sex': ,
                            // 'age_range': ,
                            'focus': selectedTargetFocus.last,
                            'nutrition': selectedTargetNutritionGoal.last,
                            'level': selectedTargetLevel.last,
                          })
                          },
                        );
                        

                        if (response.statusCode == 200) {
                          print('User info updated successfully');
                        } else {
                          throw Exception('Failed to update user info');
                        }
                    
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
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
    setState(() {
      selectedList.clear(); // Clear the list to enforce single selection
      selectedList.add(label); // Add the newly selected item
    });
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
