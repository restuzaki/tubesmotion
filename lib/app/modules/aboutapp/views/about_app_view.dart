import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/about_app_controller.dart';

class AboutAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutAppController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.info_outline,
                size: 100,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 16),
              Text(
                controller.appName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Version: ${controller.version}",
                style:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              Text(
                controller.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Text(
                controller.developer,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                controller.website,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
