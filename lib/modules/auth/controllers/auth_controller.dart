import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLogin = false.obs;
  final RxBool isSignUp = false.obs;

  void changeLogin() {
    isLogin.value = !isLogin.value;
  }

  void changeSignUp() {
    isSignUp.value = !isSignUp.value;
  }
}
