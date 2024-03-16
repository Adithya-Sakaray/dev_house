
import 'dart:html';

import 'package:dev_house/Backend_services/auth_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController  {

  RxBool isLoggedin = false.obs;
  RxString userId = "".obs;



  Future<bool> SignUpUser(String username, String email, String password, String role, String phone) async {
    var isSuccess = await AuthManager.registerUser(username, email, password, role, phone);

    return isSuccess;
  }
}