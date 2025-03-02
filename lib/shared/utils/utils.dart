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
    String savePath = "${dir?.path}/$fileName";

    await dio.download(url, savePath, onReceiveProgress: (count, total) {
      double progress = (count / total * 100);
      Get.snackbar(
        "Downloading...",
        "Progress: ${progress.toStringAsFixed(0)}%",
        duration: const Duration(seconds: 1),
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
