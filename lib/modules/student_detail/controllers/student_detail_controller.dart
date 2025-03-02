import 'package:get/get.dart';
import 'package:school_management_system/modules/student_detail/models/student_detail_models.dart';
import 'package:school_management_system/modules/student_detail/service/student_detail_service.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentDetailController extends GetxController {
  var isAuthenticated = false.obs;
  final student = Rxn<StudentDetailModel?>();
  final studentId = Get.parameters['id'];
  final StudentDetailService _studentDetailService = StudentDetailService();
  final isFetching = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
    fetchData();
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

  Future<StudentDetailModel?> fetchData() async {
    isFetching.value = true;
    try {
      final response = await _studentDetailService.getStudentDetail(studentId!);
      student.value = response;

      return response;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    } finally {
      isFetching.value = false;
    }
  }
}
