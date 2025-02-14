import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentDetailController extends GetxController {
  var isAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    final supabase = Supabase.instance.client;

    if (supabase.auth.currentSession == null) {
      isAuthenticated.value = false;
      Future.microtask(() => Get.offAllNamed(AppRoutes.LOGIN));
    } else {
      isAuthenticated.value = true;
    }
  }
}
