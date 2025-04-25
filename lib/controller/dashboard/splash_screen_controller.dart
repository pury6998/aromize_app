import 'dart:async';
import 'package:aromize_app/controller/core_controller.dart';
import 'package:aromize_app/views/auth/login_screen.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());

  @override
  void onInit() {
    Timer(const Duration(seconds: 10), () async {
      if (c.isUserLoggendIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
    super.onInit();
  }}