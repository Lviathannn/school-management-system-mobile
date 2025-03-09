import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/income_model.dart';
import 'package:school_management_system/modules/home/service/income_service.dart';
import 'package:school_management_system/modules/home/service/teacher_service.dart';

class IncomeController extends GetxController {
  final RxList<IncomeModel> incomes = <IncomeModel>[].obs;

  final isFetching = false.obs;
  final searchText = ''.obs;
  final recorderFilter = ''.obs;
  final selectedDate = Rxn<DateTimeRange>();
  final RxList<String> recorderOptions = <String>[""].obs;
  final incomeType = ''.obs;

  final temporaryRecorderFilter = ''.obs;
  final temporaryIncomeType = ''.obs;
  final temporarySelectedDate = Rxn<DateTimeRange>();

  final IncomeService _incomeService = IncomeService();
  final TeacherService _teacherService = TeacherService();

  @override
  void onInit() {
    super.onInit();
    fetchAllIncomes();
    fetchAllRecorder();

    debounce(
      searchText,
      (_) {
        fetchAllIncomes();
      },
      time: const Duration(milliseconds: 500),
    );
  }

  void resetFilter() {
    searchText.value = '';
    recorderFilter.value = '';
    incomeType.value = '';
    selectedDate.value = null;

    temporaryRecorderFilter.value = '';
    temporarySelectedDate.value = null;
    temporaryIncomeType.value = '';

    fetchAllIncomes();
  }

  Future<void> fetchAllRecorder() async {
    try {
      final response = await _teacherService.getTeacherDropdownOptions();
      if (response != null && response.isNotEmpty) {
        recorderOptions.assignAll(response);
      } else {
        recorderOptions.clear();
        recorderOptions.add("");
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<void> fetchAllIncomes() async {
    try {
      isFetching.value = true;
      final response = await _incomeService.getIncomes(
        searchText: searchText.value,
        recorderFilter: recorderFilter.value,
        selectedDate: selectedDate.value,
        incomeType: incomeType.value,
      );
      if (response != null && response.isNotEmpty) {
        incomes.assignAll(response);
      } else {
        incomes.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isFetching.value = false;
    }
  }
}
