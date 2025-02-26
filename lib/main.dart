import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tubes_motion/app/modules/mentor/controllers/mentor_controller.dart';
import 'firebase_options.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  Get.put(MentorController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
