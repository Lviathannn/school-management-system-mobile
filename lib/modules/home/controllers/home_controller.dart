import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs; // Index tab yang aktif
  late PageController pageController; // PageController untuk mengatur PageView

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
        initialPage: selectedIndex.value); // Inisialisasi PageView
  }

  // Sinkronisasi index tab Google Navbar dengan PageView
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    pageController
        .dispose(); // Bersihkan controller untuk menghindari memory leak
    super.onClose();
  }
}
