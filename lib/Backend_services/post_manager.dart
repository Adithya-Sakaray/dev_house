import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;



class PostsManager {

  static Future<List <dynamic>> fetchPostsByType(String userType) async {

    String baseUrl = "https://devhousebackend.vercel.app/post/getpost";
    final response = await http.get(Uri.parse('$baseUrl/$userType'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> postsList = jsonData['posts'];
      // print(postsList);
      return postsList;
    } else {
      print("Error in manager posts");
      throw Exception('Failed to load posts');
    }
  }

  static Future<String?> uploadPost(String userid, String content) async {
    String url = "https://devhousebackend.vercel.app/post/post";
    var body = {
      'userId': userid,
      'content': content,
      'type': 'student'
    };

    var response = await http.post(
      Uri.parse(url),
      body: body
    );

    if (response.statusCode == 201) {
      print('POST request successful');
      print('Response body: ${response.body}');
      Map<String, dynamic> jsonData = json.decode(response.body);
      print("PostID: ${jsonData["postId"]}");

      return jsonData["postId"];

    } else {
      print('Failed to make POST request. Status code: ${response.statusCode}');
    }
  }



}


