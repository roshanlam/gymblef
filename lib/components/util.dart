import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> checkLoginToken() async {
  final storage = new FlutterSecureStorage();
  String? token = await storage.read(key: 'auth_token');

  if (token != null) {
    var url = Uri.parse('http://159.203.142.48:8000/auth/user');

    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  return false;

}