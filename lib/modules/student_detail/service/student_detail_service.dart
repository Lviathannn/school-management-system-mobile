import 'package:get/get.dart';
import 'package:school_management_system/modules/student_detail/models/student_detail_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentDetailService {
  Future<StudentDetailModel?> getStudentDetail(String studentId) async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase
          .from('student')
          .select('*, profile_picture(url)')
          .eq('id', studentId)
          .single();

      return StudentDetailModel.fromJson(response);
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
