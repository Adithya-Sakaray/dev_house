
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobsManager {
  static Future<List<dynamic>> fetchJobs() async {

    String baseUrl = "https://devhousebackend.vercel.app/job/get";
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      // print(jsonData);
      return jsonData;
    } else {
      print("Error in manager posts");
      throw Exception('Failed to load jobs');
    }
  }
}