import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_management_system/modules/teacher_detail/models/teacher_detail_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherDetailService {
  Future<TeacherDetailModel?> getTeacherDetail(String teacherId) async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase
          .from('teacher')
          .select('*, profile_picture(url), attachment(*)')
          .eq('id', teacherId)
          .single();

      log('response: $response');

      return TeacherDetailModel.fromJson(response);
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
