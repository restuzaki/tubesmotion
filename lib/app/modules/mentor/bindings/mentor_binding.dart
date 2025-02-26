import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/mentor/controllers/mentor_controller.dart';

class MentorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorController>(
      () => MentorController(),
    );
  }
}
