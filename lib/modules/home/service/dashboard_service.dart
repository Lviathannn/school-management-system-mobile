import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/dashboard_model.dart';
import 'package:school_management_system/modules/home/models/total_income_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardService {
  Future<DashboardModel?> getDashboardSummary() async {
    final supabase = Supabase.instance.client;

    try {
      final studentResponse =
          await supabase.from('student').select("id").count(CountOption.exact);
      final teacherResponse =
          await supabase.from('teacher').select("id").count(CountOption.exact);
      final savingIncome =
          await supabase.from('saving').select("total").eq("type", "income");
      final savingOutcome =
          await supabase.from('saving').select("total").eq("type", "outcome");
      final sumIncome = savingIncome.fold(
          0, (prev, element) => prev + element['total'] as int);
      final sumOutcome = savingOutcome.fold(
          0, (prev, element) => prev + element['total'] as int);

      return DashboardModel.fromJson({
        'totalStudents': studentResponse.count,
        'totalTeachers': teacherResponse.count,
        'totalIncomes': sumIncome - sumOutcome,
      });
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
      return null;
    }
  }

  Future<TotalIncomeModel?> getIncomePerYear() async {
    final supabase = Supabase.instance.client;
    final currentYear = DateTime.now().year;

    try {
      final response = await supabase
          .from('income_outcome')
          .select('total, created_at')
          .eq('type', 'income')
          .gte('created_at', '$currentYear-01-01')
          .lte('created_at', '$currentYear-12-31');

      List<double> monthlyExpenses = List.generate(12, (index) => 0);

      for (var entry in response) {
        final date = DateTime.parse(entry['created_at'] as String);
        final month = date.month;
        final monthIndex = month - 1;

        monthlyExpenses[monthIndex] += entry['total'] as int;
      }

      return TotalIncomeModel(totalIncomes: monthlyExpenses);
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
      return null;
    }
  }

  Future<TotalOutcomeModel?> getOutcomePerYear() async {
    final supabase = Supabase.instance.client;
    final currentYear = DateTime.now().year;

    try {
      final response = await supabase
          .from('income_outcome')
          .select('total, created_at')
          .eq('type', 'outcome')
          .gte('created_at', '$currentYear-01-01')
          .lte('created_at', '$currentYear-12-31');

      List<double> monthlyExpenses = List.generate(12, (index) => 0);

      for (var entry in response) {
        final date = DateTime.parse(entry['created_at'] as String);
        final month = date.month;
        final monthIndex = month - 1;

        monthlyExpenses[monthIndex] += entry['total'] as int;
      }

      return TotalOutcomeModel(totalOutcomes: monthlyExpenses);
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
      return null;
    }
  }

  Future<TotalSavingModel?> getSavingPerYear() async {
    final supabase = Supabase.instance.client;
    final currentYear = DateTime.now().year;

    try {
      final response = await supabase
          .from('saving')
          .select('total, created_at, type')
          .gte('created_at', '$currentYear-01-01')
          .lte('created_at', '$currentYear-12-31');

      List<double> monthlyExpenses = List.generate(12, (index) => 0);

      for (var entry in response) {
        final date = DateTime.parse(entry['created_at'] as String);
        final month = date.month;
        final monthIndex = month - 1;

        if (entry['type'] == 'income') {
          monthlyExpenses[monthIndex] += entry['total'] as int;
        } else {
          monthlyExpenses[monthIndex] -= entry['total'] as int;
        }

        monthlyExpenses[monthIndex] += entry['total'] as int;
      }

      Get.log(monthlyExpenses.toString());
      Get.log(response.toString());

      return TotalSavingModel(totalSavings: monthlyExpenses);
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        e.toString(),
      );
      return null;
    }
  }
}
