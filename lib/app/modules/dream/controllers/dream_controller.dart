import 'package:flutter/material.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DreamController extends GetxController {
  Widget get floatingActionButton => FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 64, 70, 251),
        elevation: 10,
        onPressed: () {
          Get.offAndToNamed(Routes.QRSCANNER);
          Get.snackbar("QR Code Scanner", "Silahkan Scan QR Code");
        },
        child: const Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
      );
}
