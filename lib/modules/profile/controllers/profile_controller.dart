import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    if (supabase.auth.currentSession == null) {
      Future.microtask(() => Get.offAllNamed(AppRoutes.LOGIN));
    } else {}
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();

      Get.snackbar("Logout Berhasil", "Anda telah keluar!",
          colorText: AppColors.primary,
          barBlur: 20,
          titleText: const Text(
            "Logout Berhasil",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ));

      Get.offAllNamed("/login");
    } catch (e) {
      Get.snackbar("Logout Gagal", "Terjadi kesalahan!",
          barBlur: 20,
          titleText: const Text(
            "Logout Gagal",
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ));
    }
  }
}
