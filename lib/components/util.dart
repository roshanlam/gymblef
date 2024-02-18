import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<bool> checkLoginToken() async {
  const storage = FlutterSecureStorage();
  String? token = await storage.read(key: 'auth_token');
  String? email = await storage.read(key: 'email');

  if (email != null && token != null) {
    var verifyUserUrl =
        Uri.parse('http://159.203.142.48:8000/user/getUserInfo');

    // Send email to verify if user exists
    var userResponse = await http.post(
      verifyUserUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'email': email}),
    );

    // If user exists, verify the token
    if (userResponse.statusCode == 200) {
      var verifyTokenUrl = Uri.parse('http://159.203.142.48:8000/auth/user');

      var tokenResponse = await http.get(
        verifyTokenUrl,
        headers: {'Authorization': 'Bearer $token'},
      );

      // Return true if token is also valid (i.e., status code 200)
      return tokenResponse.statusCode == 200;
    } else {
      // User does not exist or other error
      return false;
    }
  }

  // Either email or token was null
  return false;
}
