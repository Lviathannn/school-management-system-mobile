import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController pageController; 

  @override
  void onInit() {
    super.onInit();
    final supabase = Supabase.instance.client;

    if (supabase.auth.currentSession == null) {
      Future.delayed(Duration.zero, () {
        Get.offAllNamed('/login');
      });
    }

    pageController = PageController(
        initialPage: selectedIndex.value); 
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController
        .dispose(); 
    super.onClose();
  }
}
