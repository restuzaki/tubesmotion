import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrscannerController extends GetxController {
  var scannedData = ''.obs;

  @override
  void onInit() {
    super.onInit();

    ever(scannedData, (value) {
      if (value.isNotEmpty && value.startsWith('http')) {
        launchURL(value);
      } else if (value.isNotEmpty) {
        Get.snackbar("Error", "QR Code tidak valid");
      }
    });
  }

  void onDetect(BarcodeCapture barcodeCapture) {
    if (barcodeCapture.barcodes.isEmpty) return;

    final barcode = barcodeCapture.barcodes.first;
    if (barcode.rawValue != null) {
      scannedData.value = barcode.rawValue!;
    } else {
      Get.snackbar("Error", "QR Code tidak memiliki data yang valid");
    }
  }

  void launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar("Error", "Tidak dapat membuka URL");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan saat membuka URL: $e");
    }
  }
}
