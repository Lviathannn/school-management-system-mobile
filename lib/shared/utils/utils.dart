import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

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

Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      Directory? downloadsDir = await getDownloadsDirectory();
        
    String downloadPath = "/storage/emulated/0/Download";
    if (downloadsDir != null) {
      downloadPath = downloadsDir.path;
    }

    String fileExtention = url.contains('.pdf')
        ? '.pdf'
        : url.contains('.png')
            ? '.png'
            : '.jpg';

    String savePath =
        "$downloadPath/${fileName.replaceAll(" ", "-")}$fileExtention";

    Get.snackbar("Sedang Mendownload File!", "File Sedang di download...");

    await dio.download(url, savePath, onReceiveProgress: (count, total) {});

    Get.snackbar(
      "Download Selesai!",
      "File tersimpan di: $savePath",
      colorText: AppColors.primary,
      duration: const Duration(seconds: 3),
    );

    OpenFile.open(savePath);
    } else {
      Get.snackbar(
        "Izin Ditolak",
        "Izin penyimpanan diperlukan untuk mengunduh file.",
        colorText: Colors.red,
      );
      return;
    }

  } catch (e) {
    Get.snackbar(
      "Download Gagal!",
      "Terjadi kesalahan: $e",
      duration: const Duration(seconds: 3),
      colorText: Colors.red,
    );
  }
}
