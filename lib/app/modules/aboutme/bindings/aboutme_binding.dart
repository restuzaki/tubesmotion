import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/aboutme/controllers/aboutme_controller.dart';

class AboutMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutMeController>(
      () => AboutMeController(),
    );
  }
}
