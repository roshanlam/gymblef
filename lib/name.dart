import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'selection.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController NameController = TextEditingController();
  final _storage = const FlutterSecureStorage();

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  String? selectedGender;

  Future<void> loadData() async {
    final Name = await _storage.read(key: 'Name');
    final selectedGender = await _storage.read(key: 'selectedGender');

    setState(() {
      NameController.text = Name ?? '';
      this.selectedGender = selectedGender;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
                'gimbel_assets/top.png',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 16.0),
              buildTextField('Name', NameController),
              buildGenderDropdown(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Validate inputs and proceed if valid
                  if (validateInputs()) {
                    // Add logic to process user inputs
                    await _storage.write(
                        key: 'Name', value: NameController.text);
                    await _storage.write(
                        key: 'selectedGender', value: selectedGender);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectionPage()),
                    );
                  }
                },
                // put NameController text and selectedGender in the list of dependencies
                child: const Text('Proceed'),
              )
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
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Gender',
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
        ),
        value: selectedGender,
        style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight
                .bold), // This ensures the selected value text is black
        items: genderOptions.map((gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(
              gender,
            ),
          );
        }).toList(),
        onChanged: (value) => setState(() => selectedGender = value),
        hint: const Text('Select Gender'),
      ),
    );
  }

  bool validateInputs() =>
      NameController.text.isNotEmpty && selectedGender!.isNotEmpty;
}
