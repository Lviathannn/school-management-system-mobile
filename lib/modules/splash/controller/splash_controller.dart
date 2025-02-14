import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
final supabase = Supabase.instance.client;

    if (supabase.auth.currentSession == null) {
      _redirectToLogin();
    } else {
      _redirectToHome();
    }
  }

  void _redirectToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(
      AppRoutes.HOME,
    );
  }

  void _redirectToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(
      AppRoutes.LOGIN,
    );
  }
}
