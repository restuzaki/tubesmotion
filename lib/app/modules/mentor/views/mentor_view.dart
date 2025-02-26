import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tubes_motion/app/common/custom_navbar.dart';
import 'package:tubes_motion/app/modules/favorite/views/favorite_view.dart';
import 'package:tubes_motion/app/modules/mentor/controllers/mentor_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorView extends StatelessWidget {
  final MentorController controller = Get.put(MentorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Our Best Mentors'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () => Get.to(() => FavoriteView()),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.mentors.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF00623B)),
          );
        }
        return ListView.builder(
          itemCount: controller.mentors.length,
          itemBuilder: (context, index) {
            final mentor = controller.mentors[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: mentor.thumbnail.isNotEmpty
                            ? mentor.thumbnail
                            : "https://example.com/placeholder.png",
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mentor.name.isNotEmpty ? mentor.name : 'No Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mentor.divisi.isNotEmpty
                                    ? mentor.divisi
                                    : 'Unknown Division',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: const Color(0xFF00623B),
                                    ),
                              ),
                              Obx(() => Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => controller
                                            .toggleFavorite(mentor.id),
                                        icon: Icon(
                                          controller.isFavorite(mentor.id)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              controller.isFavorite(mentor.id)
                                                  ? Colors.red
                                                  : Colors.grey,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _launchWhatsApp(mentor.phone);
                                        },
                                        icon: const Icon(Icons.chat),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: controller.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(),
    );
  }

  void _launchWhatsApp(String phoneNumber) async {
    final url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Tidak dapat membuka WhatsApp");
    }
  }
}
