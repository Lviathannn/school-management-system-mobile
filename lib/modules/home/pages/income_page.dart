import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/income_controller.dart';
import 'package:school_management_system/modules/home/models/dropdown_option.dart';
import 'package:school_management_system/modules/home/models/income_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/utils/utils.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/empty_data.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    IncomeController controller = Get.put(IncomeController());

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          toolbarHeight: 100,
          title: Column(
            children: [
              TextField(
                onChanged: (value) => {
                  controller.searchText.value = value,
                },
                style:
                    const TextStyle(color: AppColors.textLight, fontSize: 14),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  hintText: 'Cari Riwayat Transaksi',
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
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            Obx(() {
              if (controller.isFetching.value) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: Get.height - 250,
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(AppColors.primary),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                );
              }

              if (controller.incomes.isEmpty) {
                return const SliverToBoxAdapter(
                    child: EmptyData(
                  message: 'Tidak ada data pemasukan dan pengeluaran',
                ));
              }

              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                  vertical: AppSizes.paddingMedium,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return IncomeItem(
                        income: controller.incomes[index],
                      );
                    },
                    childCount: controller.incomes.length,
                  ),
                ),
              );
            }),
          ],
        ));
  }

  Future _displayBottomSheet(BuildContext context) {
    IncomeController controller = Get.find<IncomeController>();

    final incomeTypeOption = [
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
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        animationBehavior: AnimationBehavior.normal,
        duration: const Duration(milliseconds: 300),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 430,
          padding: const EdgeInsets.all(AppSizes.paddingLarge),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Obx(
            () => Column(
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
                        controller.resetFilter();
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
                          value: controller.temporaryIncomeType.value,
                          items: incomeTypeOption.map((value) {
                            return DropdownMenuItem(
                              value: value.value,
                              onTap: () => {
                                controller.temporaryIncomeType.value =
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
                          value:
                              controller.temporaryRecorderFilter.value.isEmpty
                                  ? ""
                                  : controller.temporaryRecorderFilter.value,
                          items: controller.recorderOptions.map((options) {
                            return DropdownMenuItem(
                              value: options,
                              onTap: () => {
                                controller.temporaryRecorderFilter.value =
                                    options,
                              },
                              child: Text(
                                options == "" ? "Semua Pencatat" : options,
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
                                controller.temporarySelectedDate.value = value,
                                Get.back(),
                              },
                              currentDateTextStyle: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                              enabledCellsTextStyle: const TextStyle(
                                  color: AppColors.text, fontSize: 16),
                              leadingDateTextStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              selectedCellsDecoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(
                                  0.1,
                                ),
                              ),
                              singelSelectedCellDecoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              selectedCellsTextStyle: const TextStyle(
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
                              daysOfTheWeekTextStyle: const TextStyle(
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.background,
                          ),
                          overlayColor: MaterialStateProperty.all(
                            AppColors.primary.withOpacity(0.05),
                          ),
                        ),
                        child: Obx(
                            () => controller.temporarySelectedDate.value == null
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('dd MMMM yyyy').format(
                                              controller.temporarySelectedDate
                                                  .value!.start),
                                          style: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          HugeIcons.strokeRoundedArrowRight01,
                                          color: AppColors.textLight,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          DateFormat('dd MMMM yyyy').format(
                                            controller.temporarySelectedDate
                                                .value!.end,
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
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      controller.incomeType.value =
                          controller.temporaryIncomeType.value;
                      controller.recorderFilter.value =
                          controller.temporaryRecorderFilter.value;
                      controller.selectedDate.value =
                          controller.temporarySelectedDate.value;

                      controller.fetchAllIncomes();
                      Get.back();
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
            ),
          ),
        );
      },
    );
  }
}

class IncomeItem extends StatelessWidget {
  final IncomeModel income;
  const IncomeItem({super.key, required this.income});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.paddingMedium),
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.text.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('dd MMMM yyyy').format(income.created_at),
                style:
                    AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
              ),
              AppBadge(
                backgroundColor: income.type == "income"
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.red.withOpacity(0.1),
                text: income.type == "income" ? "Masuk" : "Keluar",
                color:
                    income.type == "income" ? AppColors.primary : AppColors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedShoppingBag02,
                        color: income.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        income.description,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedNoteAdd,
                        color: income.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        income.teacher,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedDollarSquare,
                        color: income.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        formatRupiah(income.total),
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
