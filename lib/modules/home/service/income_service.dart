import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/models/income_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IncomeService {
  Future<List<IncomeModel>?> getIncomes({
    String searchText = '',
    String? recorderFilter,
    DateTimeRange? selectedDate,
    String? incomeType,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query =
          supabase.from('income_outcome').select('*,  teacher!inner(name)');

      if (searchText.isNotEmpty) {
        query = query.ilike('description', '%$searchText%');
      }

      if (recorderFilter != null && recorderFilter.isNotEmpty) {
        query = query.eq("teacher.name", recorderFilter);
      }

      if (incomeType != null && incomeType.isNotEmpty) {
        query = query.eq("type", incomeType);
      }

      if (selectedDate != null) {
        query = query
            .filter("created_at", "gte",
                DateFormat("yyyy-MM-dd").format(selectedDate.start))
            .filter("created_at", 'lte',
                DateFormat("yyyy-MM-dd").format(selectedDate.end));
      }

      final response = await query.order("created_at", ascending: false);
      final data = response.map((e) => IncomeModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      Get.snackbar("Error", "$e");
      return null;
    }
  }
}
