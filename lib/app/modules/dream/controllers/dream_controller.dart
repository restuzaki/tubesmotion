import 'package:flutter/material.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DreamController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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

  void createDream() async {
    if (textEditingController.text.trim().isEmpty) return;

    final newDream = {
      'status': false,
      'text': textEditingController.text.trim(),
    };
    await _db.collection('dream').add(newDream);
    textEditingController.clear();
  }

  void toggleDream(String id, bool status) async {
    await _db.collection('dream').doc(id).update({'status': !status});
  }

  void deleteDream(String id) async {
    await _db.collection('dream').doc(id).delete();
  }
}
