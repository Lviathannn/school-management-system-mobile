import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _redirectToHome();
  }

  void _redirectToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(
      AppRoutes.HOME,
    );
  }
}
