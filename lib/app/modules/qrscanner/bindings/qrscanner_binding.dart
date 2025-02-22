import 'package:get/get.dart';

import '../controllers/qrscanner_controller.dart';

class QrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrscannerController>(
      () => QrscannerController(),
    );
  }
}
