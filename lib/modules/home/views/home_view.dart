import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../pages/home_pages.dart';
import '../widgets/bottom_bar.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _pages = [
    const HomePages(),
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Google Navbar with GetX')),
      body: Obx(() => _pages[controller.selectedIndex.value]),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
