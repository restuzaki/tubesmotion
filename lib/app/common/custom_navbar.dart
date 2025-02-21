import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../modules/home/controllers/home_controller.dart';

class CustomNavbar extends StatelessWidget {
  CustomNavbar({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBarItem(CupertinoIcons.home, 'Home', 0),
          buildNavBarItem(
              CupertinoIcons.list_bullet_below_rectangle, 'My Dream', 1),
          const SizedBox(width: 20), // Untuk memberi ruang di tengah
          buildNavBarItem(CupertinoIcons.group_solid, 'Ask Mentor', 3),
          buildNavBarItem(CupertinoIcons.profile_circled, 'Profile', 4),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Icon(
                icon,
                color: controller.selectedIndex.value == index
                    ? const Color.fromARGB(255, 64, 70, 251)
                    : Colors.black87,
              )),
          Obx(() => Text(
                label,
                style: TextStyle(
                  color: controller.selectedIndex.value == index
                      ? const Color.fromARGB(255, 64, 70, 251)
                      : Colors.black87,
                ),
              )),
        ],
      ),
    );
  }
}
