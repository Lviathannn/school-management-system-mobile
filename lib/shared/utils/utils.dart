import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
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

    if (Platform.isAndroid) {
      if (await Permission.storage.request().isDenied) {
        Get.snackbar(
          "Izin Ditolak",
          "Izin penyimpanan diperlukan untuk mengunduh file.",
          colorText: Colors.red,
        );
        return;
      }
    }

    // 🔹 Dapatkan path folder Download
    String downloadPath = "/storage/emulated/0/Download";
    if (Platform.isIOS) {
      Directory? downloadsDir = await getApplicationDocumentsDirectory();
      downloadPath = downloadsDir.path;
    }

    String fileExtension = url.contains('.pdf')
        ? '.pdf'
        : url.contains('.png')
            ? '.png'
            : '.jpg';

    String savePath =
        "$downloadPath/${fileName.replaceAll(" ", "-")}$fileExtension";

    Get.snackbar("Sedang Mendownload File!", "File sedang diunduh...");

    await dio.download(url, savePath);

    Get.snackbar(
      "Download Selesai!",
      "File tersimpan di: $savePath",
      colorText: Colors.green,
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
