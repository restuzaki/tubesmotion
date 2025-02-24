import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/aboutapp/controllers/about_app_controller.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutAppController>(
      () => AboutAppController(),
    );
  }
}
