import 'package:flutter/material.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var name = ''.obs;
  var position = ''.obs;
  var selectedIndex = 0.obs;
  var divisions = ["MP", "Digital Business", "UI/UX"].obs;
  var internName = [
    "Joko Sumanto",
    "Dean Gentong ",
    "Jihan Centong",
    "Syihan Shomat",
    "Gea Geol",
    "Hardi Jika",
    "Raja Hati",
    "Rapa Ham"
  ].obs;
  var courseTitle = "Belajar Flutter GetX".obs;
  var scheduleTime = "18:30 - 20:30".obs;
  var room = "Tult 07.05".obs;
  var lecturerCode = "Bang Raihan".obs;
  var internImages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    bindUserData();
    fetchInterns();
  }

  void bindUserData() {
    String? userId = _auth.currentUser?.uid;

    if (userId != null) {
      _firestore.collection("users").doc(userId).snapshots().listen((snapshot) {
        if (snapshot.exists) {
          name.value = snapshot["name"] ?? "Unknown User";
          position.value = snapshot["position"] ?? "No Position Set";
        }
      });
    }
  }

  Future<void> updateProfile(String newName, String newPosition) async {
    String? userId = _auth.currentUser?.uid;
    if (userId != null) {
      await _firestore.collection("users").doc(userId).update({
        "name": newName,
        "position": newPosition,
      });
    }
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/dream');
        break;
      case 3:
        Get.toNamed('/mentor');
        break;
      case 4:
        Get.toNamed('/profile');
        break;
    }
  }

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

  void fetchInterns() async {
    try {
      var response = await Dio().get("https://randomuser.me/api/?results=8");

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;

        List<String> images = results
            .map<String>((e) => e["picture"]["large"] as String)
            .toList();

        internImages.assignAll(images);

        update();
      }
    } catch (e) {
      print("Error fetching interns: $e");
    }
  }
}
