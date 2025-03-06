import 'package:get/get.dart';
import 'package:school_management_system/modules/teacher_detail/models/teacher_detail_model.dart';
import 'package:school_management_system/modules/teacher_detail/services/teacher_detail_service.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherDetailController extends GetxController {
  var isAuthenticated = false.obs;
  final teacher = Rxn<TeacherDetailModel?>();
  final teacherId = Get.parameters['id'];
  final isFetching = false.obs;
  final TeacherDetailService _teacherDetailService = TeacherDetailService();

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
    fetchData();
  }

  Future<TeacherDetailModel?> fetchData() async {
    isFetching.value = true;
    try {
      final response = await _teacherDetailService.getTeacherDetail(teacherId!);
      teacher.value = response;

      return response;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    } finally {
      isFetching.value = false;
    }
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
}
