import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get floatingActionButton => FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 64, 70, 251),
        elevation: 10,
        onPressed: () {
          Get.snackbar("QR Code Scanner", "Silahkan Scan QR Code");
        },
        child: const Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
      );
}
