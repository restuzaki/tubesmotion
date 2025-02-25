import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AboutMeController extends GetxController {
  var description = ''.obs;
  var position = ''.obs;
  var hobby = ''.obs;
  var profileImageBase64 = ''.obs;

  final descriptionController = TextEditingController();
  final positionController = TextEditingController();
  final hobbyController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveToFirestore() async {
    String userId = "user_id";
    try {
      await _firestore.collection('users').doc(userId).set({
        'description': description.value,
        'position': position.value,
        'hobby': hobby.value,
        'profileImageBase64': profileImageBase64.value,
      }, SetOptions(merge: true));

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
