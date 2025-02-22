import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../controllers/qrscanner_controller.dart';

class QrscannerView extends StatelessWidget {
  final QrscannerController controller = Get.put(QrscannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan QR',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offNamed('/home');
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: controller.onDetect,
          ),
          Positioned.fill(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height / 3.4,
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height / 3.4,
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.4,
                  bottom: MediaQuery.of(context).size.height / 3.4,
                  left: 0,
                  width: (MediaQuery.of(context).size.width - 250) / 2,
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.4,
                  bottom: MediaQuery.of(context).size.height / 3.4,
                  right: 0,
                  width: (MediaQuery.of(context).size.width - 250) / 2,
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
                Center(
                  child: CustomPaint(
                    painter: QrBorderPainter(),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 170,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Scan pada QR Code\n yang ada",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: QRScanResult(),
          ),
        ],
      ),
    );
  }
}

class QRScanResult extends StatelessWidget {
  final QrscannerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hasil Scan QR Code',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Obx(() => Text(
                controller.scannedData.value.isNotEmpty
                    ? controller.scannedData.value
                    : 'Scan pada QR Code yang ada',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              )),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class QrBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final double cornerSize = 30;
    Path path = Path();

    path.moveTo(0, cornerSize);
    path.lineTo(0, 0);
    path.lineTo(cornerSize, 0);

    path.moveTo(size.width, cornerSize);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - cornerSize, 0);

    path.moveTo(0, size.height - cornerSize);
    path.lineTo(0, size.height);
    path.lineTo(cornerSize, size.height);

    path.moveTo(size.width, size.height - cornerSize);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - cornerSize, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
