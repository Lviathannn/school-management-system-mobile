import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/modules/splash/controller/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  // ignore: unused_field
  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          color: AppColors.primary,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 80,
                height: 80,
                child: SvgPicture.asset(
                  AppImages.logoWhite, // Path ke file SVG
                  fit: BoxFit.contain,
                ),
              ),
              const Column(
                children: [
                  Text(
                    'School Management System',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'RA Darul Ulum Tanjungsari',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
