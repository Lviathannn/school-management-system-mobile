import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Attachment extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String url;

  const Attachment({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final isPdf = url.contains('.pdf');

    return Container(
        padding: const EdgeInsets.all(AppSizes.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: HugeIcon(
                        icon: icon,
                        color: AppColors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          isPdf ? "PDF File" : "Images File",
                          style: AppTextStyles.caption
                              .copyWith(color: AppColors.textLight),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.textLight.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  icon: const Icon(HugeIcons.strokeRoundedDownload04),
                  onPressed: () async {
                    try {
                      await FileDownloader.downloadFile(
                        url: url,
                      );

                      Get.snackbar(
                          "Download Berhasil", "File telah berhasil disimpan!",
                          colorText: AppColors.primary,
                          barBlur: 20,
                          titleText: const Text(
                            "Download Berhasil",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ));
                    } catch (e) {
                      Get.snackbar(
                        "Download Gagal!",
                        "Terjadi kesalahan saat mengunduh file $e",
                        colorText: AppColors.red,
                        barBlur: 20,
                        titleText: const Text(
                          "Download Gagal!",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.textLight.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  icon: const Icon(HugeIcons.strokeRoundedFile02),
                  onPressed: () async {
                    Get.dialog(
                      Dialog(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadius),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 300,
                          ),
                          padding: const EdgeInsets.all(AppSizes.paddingSmall),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  const Text(
                                    "Preview File",
                                    style: AppTextStyles.heading,
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: IconButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      icon: const Icon(
                                        HugeIcons.strokeRoundedCancel01,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              isPdf
                                  ? const Center(
                                      child: Text("PDF Viewer"),
                                    )
                                  : Image.network(
                                      url,
                                      fit: BoxFit.contain,
                                      loadingBuilder: (context, child,
                                              loadingProgress) =>
                                          loadingProgress == null
                                              ? child
                                              : const SizedBox(
                                                  height: 300,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 3,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                ),
                                    ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ));
  }
}

