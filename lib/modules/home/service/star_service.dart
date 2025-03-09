import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/models/star_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StarService {
  Future<List<StarModel>?> getStars({
    String searchText = '',
    String? recorderFilter,
    String? classFilter,
    DateTimeRange? selectedDate,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query = supabase
          .from('star')
          .select('*, student!inner(name,student_class), teacher!inner(name)');

      if (searchText.isNotEmpty) {
        query = query.ilike('student.name', '%$searchText%');
      }

      if (recorderFilter != null && recorderFilter.isNotEmpty) {
        query = query.eq("teacher.name", recorderFilter);
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


      final data = response.map((e) => StarModel.fromJson(e)).toList();

      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
