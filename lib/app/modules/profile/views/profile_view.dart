import 'package:get/get.dart';
import 'package:tubes_motion/app/common/custom_navbar.dart';
import 'package:flutter/material.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "PROFILE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Rachael Wagner",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Junior Product Designer"),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Your App Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Container(
            height: 5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 64, 70, 251),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 35),

          // List Tiles
          ...controller.customListTiles.map(
            (tile) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 4,
                shadowColor: Colors.black12,
                child: ListTile(
                  leading: Icon(tile.icon),
                  title: Text(tile.title),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: tile.onTap,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: controller.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
