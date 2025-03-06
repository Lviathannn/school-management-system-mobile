import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/teacher_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  Future<List<TeacherModel>?> getStudents({
    String searchText = '',
    String? genderFilter,
    String? roleFilter,
    String? degreeFilter,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query = supabase.from('teacher').select('*, profile_picture(url)');

      if (searchText.isNotEmpty) {
        query = query.ilike('name', '%$searchText%');
      }
      if (genderFilter != null && genderFilter.isNotEmpty) {
        query = query.eq("gender", genderFilter);
      }
      if (roleFilter != null && roleFilter.isNotEmpty) {
        query = query.eq("role", roleFilter);
      }
      if (degreeFilter != null && degreeFilter.isNotEmpty) {
        query = query.eq("degree", degreeFilter);
      }

      final response = await query;
      final data = response.map((e) => TeacherModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
