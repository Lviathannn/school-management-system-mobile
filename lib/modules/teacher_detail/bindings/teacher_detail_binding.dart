import 'package:get/get.dart';
import 'package:school_management_system/modules/teacher_detail/controllers/teacher_detail_controller.dart';

class TeacherDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDetailController>(() => TeacherDetailController());
  }
}
