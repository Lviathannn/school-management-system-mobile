import 'package:get/get.dart';
import 'package:school_management_system/modules/home/models/teacher_model.dart';
import 'package:school_management_system/modules/home/service/teacher_service.dart';

class TeacherController extends GetxController {
  final RxList<TeacherModel> teachers = <TeacherModel>[].obs;
  final isFetching = false.obs;
  final searchText = ''.obs;
  final genderFilter = ''.obs;
  final roleFilter = ''.obs;
  final degreeFilter = ''.obs;
  final temporaryGenderFilter = ''.obs;
  final temporaryRoleFilter = ''.obs;
  final temporaryDegreeFilter = ''.obs;

  final TeacherService _teacherService = TeacherService();

  @override
  void onInit() {
    super.onInit();
    fetchAllTeacher();

    debounce(
      searchText,
      (_) {
        fetchAllTeacher();
      },
      time: const Duration(milliseconds: 500),
    );
  }

  void resetFilter() {
    searchText.value = '';
    genderFilter.value = '';
    roleFilter.value = '';
    degreeFilter.value = '';
    temporaryGenderFilter.value = '';
    temporaryRoleFilter.value = '';
    temporaryDegreeFilter.value = '';
    
    fetchAllTeacher();
  }

  Future<void> fetchAllTeacher() async {
    try {
      isFetching.value = true;
      final response = await _teacherService.getStudents(
        searchText: searchText.value,
        roleFilter: roleFilter.value,
        genderFilter: genderFilter.value,
        degreeFilter: degreeFilter.value,
      );

      if (response != null && response.isNotEmpty) {
        teachers.assignAll(response);
      } else {
        teachers.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isFetching.value = false;
    }
  }
}
