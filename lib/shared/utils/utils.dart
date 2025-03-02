import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

String formatRupiah(int number, {bool withSymbol = true}) {
  final formatter = NumberFormat.currency(
    locale: 'id',
    symbol: withSymbol ? 'Rp ' : '',
    decimalDigits: 0,
  );
  return formatter.format(number);
}

Future<void> downloadFile(String url, String fileName) async {
  try {
    Dio dio = Dio();
    Directory? dir = await getExternalStorageDirectory();
    String fileExtention = url.contains('.pdf')
        ? '.pdf'
        : url.contains('.png')
            ? '.png'
            : '.jpg';

    String savePath =
        "${dir?.path}/${fileName.replaceAll(" ", "-")}$fileExtention";

    await dio.download(url, savePath, onReceiveProgress: (count, total) {
      double progress = (count / total * 100);
      Get.generalDialog(
        pageBuilder: (_, __, ___) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Downloading...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: progress / 100,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${progress.toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        barrierDismissible: false,
      );
    });

    Get.snackbar(
      "Download Selesai!",
      "File tersimpan di: $savePath",
      colorText: AppColors.primary,
      duration: const Duration(seconds: 3),
    );

    OpenFile.open(savePath);
  } catch (e) {
    Get.snackbar(
      "Download Gagal!",
      "Terjadi kesalahan: $e",
      duration: const Duration(seconds: 3),
      colorText: Colors.red,
    );
  }
}
