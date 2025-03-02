import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class PdfPreviewView extends StatelessWidget {
  final String filePath;

  const PdfPreviewView({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: Colors.transparent,
        foregroundColor: AppColors.text,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  color: AppColors.text,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Preview File PDF",
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: PDFView(
        filePath: filePath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageSnap: true,
        onError: (error) {
          Get.snackbar("Error", "Gagal membuka PDF: $error");
        },
      ),
    );
  }
}
