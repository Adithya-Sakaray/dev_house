
import 'package:get/get.dart';
import '../Backend_services/post_manager.dart';

class FeedPageController extends GetxController {
  RxList studentPost = [].obs;
  RxList professionalPost = [].obs;
  RxList recruiterPost = [].obs;

  @override
  void onInit() {
    super.onInit();
    print("FeedPageController Init called");
    fetchPosts(); // Call fetchData when HomeController is initialized
  }

  Future<void> fetchPosts() async {
    try {
      final List<dynamic> myList1 = await PostsManager.fetchPostsByType("student");
      final List<dynamic> myList2 = await PostsManager.fetchPostsByType("recruiter");
      final List<dynamic> myList3 = await PostsManager.fetchPostsByType("professional");

      studentPost.assignAll(myList1);
      recruiterPost.assignAll(myList2);
      professionalPost.assignAll(myList3);
    }
    catch (e) {
      print("Error occured in controller fetch student posts $e");
    }
  }

  Future<void> uploadPost(String content) async {
    try {
      
      var postID = PostsManager.uploadPost("b9250706-5a76-4778-ac8d-688be4cc3de7", content);
      
    } catch(e) {
      print("Error occured while uploading $e");
    }
  }
}