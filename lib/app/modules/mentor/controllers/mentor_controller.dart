import 'package:flutter/material.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/models/mentor.dart';

class MentorController extends GetxController {
  var mentors = <Mentor>[].obs;
  var favoriteMentors = <int>{}.obs;
  final Dio _dio = Dio();

  Widget get floatingActionButton => FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 64, 70, 251),
        elevation: 10,
        onPressed: () {
          Get.toNamed(Routes.QRSCANNER);
          Get.snackbar("QR Code Scanner", "Silahkan Scan QR Code");
        },
        child: const Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
      );

  @override
  void onInit() {
    super.onInit();
    fetchMentors();
  }

  Future<void> fetchMentors() async {
    const url = "https://randomuser.me/api/?results=5";
    try {
      final response = await _dio.get(url);

      if (response.data != null && response.data['results'] != null) {
        final List<dynamic> results = response.data['results'];

        mentors.assignAll(results.asMap().entries.map((entry) {
          int id = entry.key + 1;
          return Mentor.fromJson(entry.value, id);
        }).toList());
      } else {
        print("Gagal memuat mentor: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error saat mengambil mentor: $e");
    }
  }

  void toggleFavorite(int mentorId) {
    if (favoriteMentors.contains(mentorId)) {
      favoriteMentors.remove(mentorId);
    } else {
      favoriteMentors.add(mentorId);
    }
  }

  bool isFavorite(int mentorId) => favoriteMentors.contains(mentorId);
}
