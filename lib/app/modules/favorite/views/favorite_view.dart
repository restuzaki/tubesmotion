import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tubes_motion/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Mentors")),
      body: Obx(() => controller.favoriteMentors.isEmpty
          ? Center(child: Text("No favorite mentors yet"))
          : ListView.builder(
              itemCount: controller.favoriteMentors.length,
              itemBuilder: (context, index) {
                final mentor = controller.favoriteMentors[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: mentor.thumbnail ??
                        "https://example.com/placeholder.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(mentor.name),
                  subtitle: Text('${mentor.divisi}'),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      controller.mentorController.toggleFavorite(mentor.id);
                      controller.updateFavorites();
                    },
                  ),
                );
              },
            )),
    );
  }
}

class Mentor {
  final int id;
  final String? title;
  final String? thumbnail;
  final double price;

  Mentor({required this.id, this.title, this.thumbnail, required this.price});
}
