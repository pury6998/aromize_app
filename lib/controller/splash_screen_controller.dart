import 'dart:async';
import 'package:aromize_app/views/auth/login_screen.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () async {
      Get.offAll(() => LoginScreen());
    });
    super.onInit();
  }
}
