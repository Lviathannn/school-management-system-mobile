import 'package:get/get.dart';

class StudentController extends GetxController {
  int activeIndex = 0;
  void changeIndex(int index) {
    activeIndex = index;
    update();
  }
}
