import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/PostModel.dart';

class PostsManager {

  static Future<List<Post>> fetchPostsByType(String userType) async {
    String baseUrl = "https://devhousebackend.vercel.app/post/getpost";
    final response = await http.get(Uri.parse('$baseUrl/$userType'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Post>  dataList = [];
      for(var jsonItem in jsonData) {
        dataList.add(Post.fromJson(jsonItem));
      }
      return dataList;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}


