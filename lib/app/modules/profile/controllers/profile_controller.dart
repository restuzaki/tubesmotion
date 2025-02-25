import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  List<CustomListTile> customListTiles = [
    CustomListTile(
      icon: Icons.favorite,
      title: "Loved Mentors",
      onTap: () {},
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
      onTap: () {},
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
