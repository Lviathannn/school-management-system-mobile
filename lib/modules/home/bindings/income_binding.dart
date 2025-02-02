import 'package:get/get.dart';
import 'package:school_management_system/modules/home/controllers/income_controller.dart';

class IncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeController>(() => IncomeController());
  }
}
