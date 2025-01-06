import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aromize_app/controller/splash_screen_controller.dart';
import 'package:aromize_app/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width /
                  2.5, // Adjust the width of the logo as per the design
              child: Image.asset(ImagePath.logo),
            ),
            const SizedBox(
                height: 20), // Space between logo and CircularProgressIndicator
            const CircularProgressIndicator(
              color: Colors
                  .black, // Match the color of the progress indicator as in the image
            ),
          ],
        ),
      ),
    );
  }
}
