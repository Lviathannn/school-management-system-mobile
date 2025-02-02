import 'package:get/get.dart';
import 'package:school_management_system/modules/home/controllers/teacher_controller.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherController>(() => TeacherController());
  }
}
