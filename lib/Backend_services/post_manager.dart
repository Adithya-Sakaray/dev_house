import 'dart:convert';
import 'package:http/http.dart' as http;



class PostsManager {

  static Future<List <dynamic>> fetchPostsByType(String userType) async {

    String baseUrl = "https://devhousebackend.vercel.app/post/getpost";
    final response = await http.get(Uri.parse('$baseUrl/$userType'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> postsList = jsonData['posts'];
      print(postsList);
      return postsList;
    } else {
      print("Error in manager posts");
      throw Exception('Failed to load posts');
    }
  }
}


