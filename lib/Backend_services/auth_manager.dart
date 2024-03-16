import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {


  static Future<bool> registerUser(String username, String email, String password, String role, String phone) async {
    String url = "https://devhousebackend.vercel.app/user";

    final response = await http.post(
      Uri.parse('$url/signup'),
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'role': role,
        'mobileNumber1': phone
      }),
    );

    if (response.statusCode == 201) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      print(jsonData);


      prefs.setBool("Logged", true);
      prefs.setString("userId", "");
      return true;
    } else {
      return false;
    }
  }

}