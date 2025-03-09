import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/controllers/tab_controller.dart';
import 'package:school_management_system/modules/home/models/dropdown_option.dart';
import 'package:school_management_system/modules/home/widgets/point_content.dart';
import 'package:school_management_system/modules/home/widgets/saving_content.dart';
import 'package:school_management_system/modules/home/widgets/student_content.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

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
      DropdownOption(value: "", label: "Semua Kelas"),
      DropdownOption(value: "A", label: "Kelas A"),
      DropdownOption(value: "B", label: "Kelas B"),
    ];

    final genderOption = [
      DropdownOption(label: "Semua Gender", value: ""),
      DropdownOption(label: "Perempuan", value: "p"),
      DropdownOption(label: "Laki-laki", value: "l"),
    ];

    final savingTypeOption = [
      DropdownOption(label: "Semua Tabungan", value: ""),
      DropdownOption(label: "Masuk", value: "income"),
      DropdownOption(label: "Keluar", value: "outcome"),
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
            height: tabController.currentTabIndex.value == 0
                ? 350
                : tabController.currentTabIndex.value == 1
                    ? 480
                    : 420,
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
                Row(
                  children: [
                    const Text("Filter",
                        style: TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        studentController.resetFilter();
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        foregroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                          value: studentController.temporaryClassFilter.value,
                          items: classOption.map((value) {
                            return DropdownMenuItem(
                              value: value.value,
                              onTap: () => {
                                studentController.temporaryClassFilter.value =
                                    value.value,
                              },
                              child: Text(
                                value.label,
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
                                  value: studentController
                                      .temporaryGenderFilter.value,
                                  items: genderOption.map((value) {
                                    return DropdownMenuItem(
                                      value: value.value,
                                      onTap: () => {
                                        studentController.temporaryGenderFilter
                                            .value = value.value,
                                      },
                                      child: Text(
                                        value.label,
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
                            tabController.currentTabIndex.value == 1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Tipe Tabungan",
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
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                color: AppColors.background,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                HugeIcons
                                                    .strokeRoundedArrowDown01,
                                                color: AppColors.textLight,
                                              ),
                                            ),
                                            dropdownStyleData:
                                                DropdownStyleData(
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
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
                                            value: studentController
                                                .temporarySavingType.value,
                                            items:
                                                savingTypeOption.map((value) {
                                              return DropdownMenuItem(
                                                value: value.value,
                                                onTap: () => {
                                                  studentController
                                                      .temporarySavingType
                                                      .value = value.value,
                                                },
                                                child: Text(
                                                  value.label,
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
                                : const SizedBox(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Pencatat",
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
                                      value: studentController
                                              .temporaryRecorderFilter
                                              .value
                                              .isEmpty
                                          ? ""
                                          : studentController
                                              .temporaryRecorderFilter.value,
                                      items: studentController.recorderOptions
                                          .map((options) {
                                        return DropdownMenuItem(
                                          value: options,
                                          onTap: () => {
                                            studentController
                                                .temporaryRecorderFilter
                                                .value = options,
                                          },
                                          child: Text(
                                            options == ""
                                                ? "Semua Pencatat"
                                                : options,
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
                                  "Range Tanggal",
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () async {
                                      Get.dialog(Dialog(
                                        backgroundColor: AppColors.white,
                                        child: RangeDatePicker(
                                          onRangeSelected: (value) => {
                                            studentController
                                                .temporarySelectedDate
                                                .value = value,
                                            Get.back(),
                                          },
                                          currentDateTextStyle: const TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16,
                                          ),
                                          enabledCellsTextStyle:
                                              const TextStyle(
                                                  color: AppColors.text,
                                                  fontSize: 16),
                                          leadingDateTextStyle: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          selectedCellsDecoration:
                                              BoxDecoration(
                                            color:
                                                AppColors.primary.withOpacity(
                                              0.1,
                                            ),
                                          ),
                                          singelSelectedCellDecoration:
                                              const BoxDecoration(
                                            color: AppColors.primary,
                                            shape: BoxShape.circle,
                                          ),
                                          selectedCellsTextStyle:
                                              const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 16,
                                          ),
                                          currentDateDecoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.primary,
                                              width: 2,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          daysOfTheWeekTextStyle:
                                              const TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.text,
                                                  fontWeight: FontWeight.w500),
                                          maxDate: DateTime.now().add(
                                            const Duration(
                                              days: 365,
                                            ),
                                          ),
                                          minDate: DateTime.now().subtract(
                                            const Duration(
                                              days: 365,
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        AppColors.background,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        AppColors.primary.withOpacity(0.05),
                                      ),
                                    ),
                                    child: Obx(() => studentController
                                                .temporarySelectedDate.value ==
                                            null
                                        ? const Text(
                                            "Pilih Tanggal",
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 14,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  DateFormat('dd MMMM yyyy')
                                                      .format(studentController
                                                          .temporarySelectedDate
                                                          .value!
                                                          .start),
                                                  style: const TextStyle(
                                                    color: AppColors.text,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                const Icon(
                                                  HugeIcons
                                                      .strokeRoundedArrowRight01,
                                                  color: AppColors.textLight,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  DateFormat('dd MMMM yyyy')
                                                      .format(
                                                    studentController
                                                        .temporarySelectedDate
                                                        .value!
                                                        .end,
                                                  ),
                                                  style: const TextStyle(
                                                    color: AppColors.text,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      studentController.classFilter.value =
                          studentController.temporaryClassFilter.value;
                      studentController.genderFilter.value =
                          studentController.temporaryGenderFilter.value;
                      studentController.recorderFilter.value =
                          studentController.temporaryRecorderFilter.value;
                      studentController.selectedDate.value =
                          studentController.temporarySelectedDate.value;
                      studentController.savingType.value =
                          studentController.temporarySavingType.value;

                      studentController.fetchAllStudent();
                      studentController.fetchAllStar();
                      studentController.fetchAllSavings();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
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
