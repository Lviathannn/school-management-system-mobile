import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/controllers/tab_controller.dart';
import 'package:school_management_system/modules/home/widgets/point_content.dart';
import 'package:school_management_system/modules/home/widgets/saving_content.dart';
import 'package:school_management_system/modules/home/widgets/student_content.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final TabViewController tabController = Get.put(TabViewController());

  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          toolbarHeight: 100,
          title: Column(
            children: [
              TextField(
                style:
                    const TextStyle(color: AppColors.textLight, fontSize: 14),
                cursorColor: AppColors.primary,
                onChanged: (value) => {
                  studentController.searchText.value = value,
                },
                decoration: InputDecoration(
                  hintText: 'Cari Siswa',
                  hintStyle:
                      const TextStyle(color: AppColors.textLight, fontSize: 14),
                  prefixIcon: const Icon(
                    HugeIcons.strokeRoundedSearch01,
                    size: 20,
                    color: AppColors.textLight,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: AppColors.primary,
                    ),
                  ),
                  focusColor: AppColors.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  suffixIcon: IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Icon(
                        HugeIcons.strokeRoundedSettings04,
                        color: AppColors.textLight,
                      ),
                    ),
                    onPressed: () {
                      _displayBottomSheet(context);
                    },
                  ),
                ),
              ),
              TabBar(
                controller: tabController.tabController,
                onTap: (index) {
                  tabController.currentTabIndex.value = index;
                },
                dividerColor: AppColors.textLight.withOpacity(0),
                labelColor: AppColors.primary,
                indicatorColor: AppColors.primary,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: const [
                  Tab(text: 'Siswa'),
                  Tab(text: 'Tabungan'),
                  Tab(text: 'Nilai'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController.tabController,
          children: const [
            StudentContent(),
            SavingContent(),
            PointContent(),
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    final TabViewController tabController = Get.find<TabViewController>();
    final StudentController studentController = Get.find<StudentController>();

    final classOption = [
      "",
      "A",
      "B",
    ];

    final genderOption = [
      "",
      "p",
      "l",
    ];

    final studentOption = [
      "Semua Siswa",
      "Muhammad Iqbal",
      "Muhammad Asrul",
      "Muhammad Rizal",
      "Muhammad Fadil",
      "Athika Tsary"
    ];

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Obx(() => Container(
            width: double.infinity,
            height: tabController.currentTabIndex.value == 0 ? 300 : 450,
            padding: const EdgeInsets.all(AppSizes.paddingLarge),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kelas",
                      style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          buttonStyleData: ButtonStyleData(
                            padding: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              HugeIcons.strokeRoundedArrowDown01,
                              color: AppColors.textLight,
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          style: const TextStyle(
                              color: AppColors.textLight, fontSize: 14),
                          value: studentController.classFilter.value,
                          items: classOption.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              onTap: () => {
                                studentController.classFilter.value = value,
                              },
                              child: Text(
                                value == "" ? "Semua Kelas" : "Kelas $value",
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => tabController.currentTabIndex.value == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Gender",
                              style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  buttonStyleData: ButtonStyleData(
                                    padding: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.background,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      HugeIcons.strokeRoundedArrowDown01,
                                      color: AppColors.textLight,
                                    ),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: const TextStyle(
                                      color: AppColors.textLight, fontSize: 14),
                                  value: studentController.genderFilter.value,
                                  items: genderOption.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      onTap: () => {
                                        studentController.genderFilter.value =
                                            value,
                                      },
                                      child: Text(
                                        value == ""
                                            ? "Semua Gender"
                                            : value == "p"
                                                ? "Perempuan"
                                                : "Laki-laki",
                                        style: const TextStyle(
                                          color: AppColors.text,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Siswa",
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      buttonStyleData: ButtonStyleData(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          HugeIcons.strokeRoundedArrowDown01,
                                          color: AppColors.textLight,
                                        ),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: AppColors.textLight,
                                          fontSize: 14),
                                      value: studentOption[0],
                                      items: studentOption.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: AppColors.text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tanggal Mulai",
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      buttonStyleData: ButtonStyleData(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          HugeIcons.strokeRoundedArrowDown01,
                                          color: AppColors.textLight,
                                        ),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: AppColors.textLight,
                                          fontSize: 14),
                                      value: studentOption[0],
                                      items: studentOption.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: AppColors.text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tanggal Selesai",
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      buttonStyleData: ButtonStyleData(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          HugeIcons.strokeRoundedArrowDown01,
                                          color: AppColors.textLight,
                                        ),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: AppColors.textLight,
                                          fontSize: 14),
                                      value: studentOption[0],
                                      items: studentOption.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: AppColors.text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 25),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      studentController.fetchAllStudent();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding:
                          const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Terapkan",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            )));
      },
    );
  }
}
