import 'package:get/get.dart';
import 'package:school_management_system/modules/student_detail/controllers/student_detail_controller.dart';

class StudentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDetailController>(() => StudentDetailController());
  }
}
