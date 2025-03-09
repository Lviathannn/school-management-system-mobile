import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/modules/home/models/dashboard_model.dart';
import 'package:school_management_system/modules/home/service/dashboard_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController pageController;
  final isSummaryFetching = false.obs;
  final isIncomeFetching = false.obs;
  final Rxn<DashboardModel> dashboardSummary = Rxn<DashboardModel>();
  final Rx<List<double>> monthlyIncome =
      Rx<List<double>>([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  final Rx<List<double>> monthlyOutcome =
      Rx<List<double>>([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  final Rx<List<double>> monthlySaving =
      Rx<List<double>>([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  DashboardService dashboardService = DashboardService();

  @override
  void onInit() {
    super.onInit();
    final supabase = Supabase.instance.client;

    getDashboardSummary();
    getMonthlyIncome();
    getMonthlyOutcome();
    getMonthlySaving();

    if (supabase.auth.currentSession == null) {
      Future.delayed(Duration.zero, () {
        Get.offAllNamed('/login');
      });
    }

    pageController = PageController(initialPage: selectedIndex.value);
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> getDashboardSummary() async {
    try {
      isSummaryFetching.value = true;
      final dashboard = await dashboardService.getDashboardSummary();
      if (dashboard != null) {
        dashboardSummary.value = dashboard;
      }
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
    } finally {
      isSummaryFetching.value = false;
    }
  }

  Future<void> getMonthlyIncome() async {
    try {
      isIncomeFetching.value = true;
      final dashboard = await dashboardService.getIncomePerYear();
      if (dashboard != null) {
        monthlyIncome.value = dashboard.totalIncomes;
      }
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
    } finally {
      isIncomeFetching.value = false;
    }
  }

  Future<void> getMonthlyOutcome() async {
    try {
      isIncomeFetching.value = true;
      final dashboard = await dashboardService.getOutcomePerYear();
      if (dashboard != null) {
        monthlyOutcome.value = dashboard.totalOutcomes;
      }
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
    } finally {
      isIncomeFetching.value = false;
    }
  }

  Future<void> getMonthlySaving() async {
    try {
      isIncomeFetching.value = true;
      final dashboard = await dashboardService.getSavingPerYear();
      if (dashboard != null) {
        monthlySaving.value = dashboard.totalSavings;
      }
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
    } finally {
      isIncomeFetching.value = false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
