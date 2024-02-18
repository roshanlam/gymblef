import 'package:flutter/material.dart';
import 'package:gymblef/selection.dart';
import 'login.dart'; // import the login.dart file
import './components/util.dart';
import './components/popup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    bool isValid = await checkLoginToken();
    showErrorDialog(context: context, errorMessage: 'Checked Login');
    if (isValid) {
      // If the login is valid, navigate to another page.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectionPage()),
      );
    } else {
      // If the login is not valid, navigate to the LoginPage.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child:
            Image.asset('gimbel_assets/splash_screen.png', fit: BoxFit.cover));
  }
}
