
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventManager {
  static Future<List<dynamic>> fetchEvents() async {

    String baseUrl = "https://devhousebackend.vercel.app/event/get";
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      // print(jsonData);
      return jsonData;
    } else {
      print("Error in manager events");
      throw Exception('Failed to load events');
    }
  }
}