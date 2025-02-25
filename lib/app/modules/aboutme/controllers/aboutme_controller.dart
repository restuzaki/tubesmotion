import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_motion/app/modules/profile/controllers/profile_controller.dart';

class AboutMeController extends GetxController {
  var description = ''.obs;
  var position = ''.obs;
  var hobby = ''.obs;
  var profileImageBase64 = ''.obs;

  final descriptionController = TextEditingController();
  final positionController = TextEditingController();
  final hobbyController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    String? userId = _auth.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        description.value = userDoc["description"] ?? "";
        position.value = userDoc["position"] ?? "";
        hobby.value = userDoc["hobby"] ?? "";
        profileImageBase64.value = userDoc["profileImageBase64"] ?? "";

        descriptionController.text = description.value;
        positionController.text = position.value;
        hobbyController.text = hobby.value;
      }
    }
  }

  Future<void> saveToFirestore() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) return;

    try {
      await _firestore.collection('users').doc(userId).update({
        'description': description.value,
        'position': position.value,
        'hobby': hobby.value,
        'profileImageBase64': profileImageBase64.value,
      });

      Get.find<ProfileController>().bindUserData();

      Get.snackbar("Success", "Profile updated successfully",
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar("Error", "Failed to save data: $e",
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        Uint8List imageBytes = await image.readAsBytes();
        profileImageBase64.value = base64Encode(imageBytes);
      } else {
        Get.snackbar("Info", "No image selected",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e",
          snackPosition: SnackPosition.TOP);
    }
  }
}
