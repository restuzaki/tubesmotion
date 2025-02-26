import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/mentor/controllers/mentor_controller.dart';
import 'package:tubes_motion/app/models/mentor.dart';

class FavoriteController extends GetxController {
  final MentorController mentorController = Get.find<MentorController>();
  RxList<Mentor> favoriteMentors = <Mentor>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateFavorites();
  }

  void updateFavorites() {
    favoriteMentors.value = mentorController.mentors
        .where((mentor) => mentorController.isFavorite(mentor.id))
        .toList();
  }
}
