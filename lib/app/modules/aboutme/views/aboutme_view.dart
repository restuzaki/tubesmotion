import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/common/widgets/custom_button.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import '../controllers/aboutme_controller.dart';

class AboutMeView extends StatelessWidget {
  final AboutMeController controller = Get.put(AboutMeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me"),
        centerTitle: true,
      ),
      body: ListView(padding: const EdgeInsets.all(10), children: [
        Column(
          children: [
            Stack(
              children: [
                Obx(() {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: controller
                            .profileImageBase64.value.isNotEmpty
                        ? MemoryImage(
                            base64Decode(controller.profileImageBase64.value))
                        : const NetworkImage(
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?auto=format&fit=crop&w=386&q=80")
                            as ImageProvider,
                  );
                }),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => controller.pickImage(),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Change Your Profile Image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField(
                  label: "Description",
                  hint: "Beritahu kami tentang dirimu!",
                  controller: controller.descriptionController,
                  onChanged: (value) => controller.description.value = value),
              const SizedBox(height: 10),
              _buildTextField(
                  label: "Position",
                  hint: "Masukkan posisi Anda",
                  controller: controller.positionController,
                  onChanged: (value) => controller.position.value = value),
              const SizedBox(height: 10),
              _buildTextField(
                  label: "Hobby",
                  hint: "Masukkan hobi Anda",
                  controller: controller.hobbyController,
                  onChanged: (value) => controller.hobby.value = value),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Save',
                  onTap: () async {
                    await controller.saveToFirestore();
                    Get.offAndToNamed(Routes.PROFILE);
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
