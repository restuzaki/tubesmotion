import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
  }
}
