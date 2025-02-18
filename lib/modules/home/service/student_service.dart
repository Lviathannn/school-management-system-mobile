import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/student_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentService {
  Future<List<StudentModel>?> getStudents({
    String searchText = '',
    String? genderFilter,
    String? classFilter,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query = supabase.from('student').select();

      if (searchText.isNotEmpty) {
        query = query.ilike('name', '%$searchText%');
      }
      if (genderFilter != null && genderFilter.isNotEmpty) {
        query = query.eq("gender", genderFilter);
      }
      if (classFilter != null && classFilter.isNotEmpty) {
        query = query.eq("student_class", classFilter);
      }

      final response = await query;
      final data = response.map((e) => StudentModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
