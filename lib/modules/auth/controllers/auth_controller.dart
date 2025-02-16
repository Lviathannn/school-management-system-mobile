import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      _checkAuthStatus();
    });
  }

  void _checkAuthStatus() {
    if (supabase.auth.currentSession != null) {
      Future.microtask(() => Get.offAllNamed(AppRoutes.HOME));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);
      if (response.session != null) {
        Get.snackbar("Login berhasil", "Selamat datang kembali!",
            colorText: AppColors.primary,
            barBlur: 20,
            titleText: const Text(
              "Login Berhasil",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ));
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.snackbar("Login Gagal", "Email atau password salah!");
      }
    } on AuthApiException catch (e) {
      if (e.code == "validation_failed") {
        Get.snackbar("Login Gagal", "Email atau password tidak boleh kosong!",
            colorText: AppColors.red,
            barBlur: 20,
            titleText: const Text(
              "Login Gagal",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
          ),
        );
      }
    
      if (e.code == "invalid_credentials") {
        Get.snackbar("Login Gagal", "Email atau password salah!",
            colorText: AppColors.red,
            barBlur: 20,
            titleText: const Text(
              "Login Gagal",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login Gagal",
        "Terjadi kesalahan! : $e",
        colorText: AppColors.red,
        barBlur: 20,
        titleText: const Text(
          "Login Gagal",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

}
