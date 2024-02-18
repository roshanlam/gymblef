import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController preferredNameController = TextEditingController();
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  String selectedGender = '';

  NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6C0C),
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
              const SizedBox(height: 16.0),
              buildTextField('First Name', firstNameController),
              buildTextField('Last Name', lastNameController),
              buildTextField('Preferred Name', preferredNameController),
              buildGenderDropdown(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Validate inputs and proceed if valid
                  if (validateInputs()) {
                    // Add logic to process user inputs
                    print('First Name: ${firstNameController.text}');
                    print('Last Name: ${lastNameController.text}');
                    print('Preferred Name: ${preferredNameController.text}');
                    print('Selected Gender: $selectedGender');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return SizedBox(
      height: 80.0,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return SizedBox(
      height: 80.0,
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          labelText: 'Gender',
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
        ),
        value: selectedGender,
        items: genderOptions.map((gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (value) {
          selectedGender = value.toString();
        },
      ),
    );
  }

  bool validateInputs() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        preferredNameController.text.isNotEmpty &&
        selectedGender.isNotEmpty;
  }
}
