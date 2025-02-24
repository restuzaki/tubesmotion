import 'package:get/get.dart';

import 'package:tubes_motion/app/modules/dream/controllers/dream_controller.dart';

class DreamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamController>(
      () => DreamController(),
    );
  }
}
