import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/models/saving_model.dart';
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
      var query = supabase.from('student').select('*, profile_picture(url)');

      if (searchText.isNotEmpty) {
        query = query.ilike('name', '%$searchText%');
      }
      if (genderFilter != null && genderFilter.isNotEmpty) {
        query = query.eq("gender", genderFilter);
      }
      if (classFilter != null && classFilter.isNotEmpty) {
        query = query.eq("student_class", classFilter);
      }

      final response = await query.order("name", ascending: true);
      final data = response.map((e) => StudentModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }

  Future<List<SavingModel>?> getSavings({
    String searchText = '',
    String? classFilter,
    String? recorderFilter,
    DateTimeRange? selectedDate,
    String? savingType,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query = supabase
          .from('saving')
          .select('*, student!inner(name,student_class), teacher!inner(name)');

      if (searchText.isNotEmpty) {
        query = query.ilike('student.name', '%$searchText%');
      }

      if (recorderFilter != null && recorderFilter.isNotEmpty) {
        query = query.eq("teacher.name", recorderFilter);
      }

      if (savingType != null && savingType.isNotEmpty) {
        query = query.eq("type", savingType);
      }

      if (classFilter != null && classFilter.isNotEmpty) {
        query = query.eq("student.student_class", classFilter);
      }

      if (selectedDate != null) {
        query = query
            .filter("created_at", "gte",
                DateFormat("yyyy-MM-dd").format(selectedDate.start))
            .filter("created_at", 'lte',
                DateFormat("yyyy-MM-dd").format(selectedDate.end));
      }

      final response = await query.order("created_at", ascending: false);
      final data = response.map((e) => SavingModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
