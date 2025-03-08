import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/star_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StarService {
  Future<List<StarModel>?> getStars({
    String searchText = '',
    String? genderFilter,
    String? classFilter,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      var query = supabase
          .from('star')
          .select('*, student!inner(name), teacher!inner(name)');

      if (searchText.isNotEmpty) {
        query = query.ilike('student.name', '%$searchText%');
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
