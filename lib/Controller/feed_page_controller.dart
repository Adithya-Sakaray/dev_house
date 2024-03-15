
import 'package:get/get.dart';

import '../Models/PostModel.dart';
import '../Backend_services/post_manager.dart';

class FeedPageController extends GetxController {
  RxList<Post> allOfferModel = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Call fetchData when HomeController is initialized
  }

  Future<void> fetchPosts() async {
    try {
      final List<Post> myList = await PostsManager.fetchPostsByType("student");
      allOfferModel.assignAll(myList);
    }
    catch (e) {
      print("Error occured in controller fetch student posts");
    }
  }
}