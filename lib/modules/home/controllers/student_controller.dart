import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/student_model.dart';
import 'package:school_management_system/modules/home/service/student_service.dart';

class StudentController extends GetxController {
  int activeIndex = 0;
  final RxList<StudentModel> students = <StudentModel>[].obs;
  final isFetching = false.obs;
  final searchText = ''.obs;
  final genderFilter = ''.obs;
  final classFilter = ''.obs;
  final temporaryGenderFilter = ''.obs;
  final temporaryClassFilter = ''.obs;

  final StudentService _studentService = StudentService();

  void changeIndex(int index) {
    activeIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllStudent();

    debounce(
      searchText,
      (_) {
        fetchAllStudent();
      },
      time: const Duration(milliseconds: 500),
    );
  }

void resetFilter() {
    searchText.value = '';
    genderFilter.value = '';
    classFilter.value = '';
    temporaryGenderFilter.value = '';
    temporaryClassFilter.value = '';

    fetchAllStudent();
  }

  Future<void> fetchAllStudent() async {
    // Fetch all student data
    try {
      isFetching.value = true;
      final response = await _studentService.getStudents(
        searchText: searchText.value,
        classFilter: classFilter.value,
        genderFilter: genderFilter.value,
      );
      if (response != null && response.isNotEmpty) {
        students.assignAll(response);
      } else {
        students.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isFetching.value = false;
    }
  }
}
