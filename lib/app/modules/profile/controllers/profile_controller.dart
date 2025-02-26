import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var name = ''.obs;
  var position = ''.obs;

  @override
  void onInit() {
    super.onInit();
    bindUserData();
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

  List<CustomListTile> customListTiles = [
    CustomListTile(
      icon: Icons.favorite,
      title: "Loved Mentors",
      onTap: () {
        Get.toNamed(Routes.FAVORITE);
      },
    ),
    CustomListTile(
      icon: CupertinoIcons.person_alt,
      title: "About Me",
      onTap: () {
        Get.toNamed(Routes.ABOUT_ME);
      },
    ),
    CustomListTile(
      title: "About App",
      icon: CupertinoIcons.info_circle,
      onTap: () {
        Get.toNamed(Routes.ABOUT_APP);
      },
    ),
    CustomListTile(
      title: "Logout",
      icon: CupertinoIcons.arrow_right_arrow_left,
      onTap: () {
        Get.snackbar("Success", "Thank you for using this app",
            snackPosition: SnackPosition.TOP);

        Future.delayed(Duration(seconds: 2), () {
          Get.toNamed(Routes.LOGIN);
        });
      },
    ),
  ];

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

class ProfileCompletionCard {
  final String title;
  final IconData icon;
  final String buttonText;

  ProfileCompletionCard({
    required this.title,
    required this.icon,
    required this.buttonText,
  });
}

class CustomListTile {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
