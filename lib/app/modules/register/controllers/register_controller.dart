import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String userId = userCredential.user!.uid;

      await _firestore.collection('users').doc(userId).set({
        "name": nameController.text,
        "createdAt": DateTime.now(),
      });

      Get.snackbar("Success", "Account Created Successfully!");
      Get.offAndToNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
