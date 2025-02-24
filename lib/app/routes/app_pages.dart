import 'package:get/get.dart';
import 'package:tubes_motion/app/modules/profile/bindings/profile_binding.dart';
import 'package:tubes_motion/app/modules/profile/views/profile_view.dart';
import 'package:tubes_motion/app/modules/aboutapp/bindings/about_app_bindings.dart';
import 'package:tubes_motion/app/modules/aboutapp/views/about_app_view.dart';
import 'package:tubes_motion/app/modules/qrscanner/bindings/qrscanner_binding.dart';
import 'package:tubes_motion/app/modules/qrscanner/views/qrscanner_view.dart';
import '../modules/login/views/login_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.QRSCANNER,
      page: () => QrscannerView(),
      binding: QrScannerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_APP,
      page: () => AboutAppView(),
      binding: AboutAppBinding(),
    ),
  ];
}
