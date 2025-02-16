// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/auth/controllers/auth_controller.dart';
import 'package:school_management_system/modules/auth/controllers/validation_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class LoginPages extends StatelessWidget {
  LoginPages({super.key});

  final AuthController authController = Get.put(AuthController());
  final ValidationController validationController =
      Get.put(ValidationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logoText,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                const SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masuk',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBold,
                        ),
                      ),
                      Text(
                        "Masuk untuk melanjutkan!",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => TextFormField(
                                cursorColor: AppColors.primary,
                                onChanged: (value) {
                                  validationController.email.value = value;
                                },
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  errorText: validationController
                                          .emailError.value.isEmpty
                                      ? null
                                      : validationController.emailError.value,
                                  errorStyle: const TextStyle(
                                    color: AppColors.red,
                                  ),
                                  hintText: 'Masukan email anda!',
                                  hintStyle: const TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => TextFormField(
                                cursorColor: AppColors.primary,
                                onChanged: (value) {
                                  validationController.password.value = value;
                                },
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                    color: AppColors.red,
                                  ),
                                  errorText: validationController
                                          .passwordError.value.isEmpty
                                      ? null
                                      : validationController
                                          .passwordError.value,
                                  hintText: 'Masukan password anda!',
                                  hintStyle: const TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      authController.login(
                        validationController.email.value,
                        validationController.password.value,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.primary),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "© 2024 DARULULUM Powered by Leviathan",
                    style: AppTextStyles.caption,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Center(
                  child: Text(
                    "All Rights Reserved",
                    style: AppTextStyles.caption,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
