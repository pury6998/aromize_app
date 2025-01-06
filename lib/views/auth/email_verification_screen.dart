import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/image_path.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmailVerificationScreen extends StatelessWidget {
  static String routeName = "/email-verification_screen";
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Image.asset(ImagePath.verification),
            const SizedBox(height: 18),
            Text(
              "OTP Verification",
              style: CustomTextStyles.f32W600(),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: Get.width / 1.2,
              child: Text(
                "Thank you for registering with you. Please type the OTP as shared on your email address xxx@gmail.com",
                style: CustomTextStyles.f14W400(color: AppColors.lGrey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 17),
            
            const SizedBox(height: 20), // Space between Pinput and button
            InkWell(
              onTap: () {
                print('Resend code tapped');
                // Add your resend code logic here
              },
              child: Text(
                "Didn't get code? Send",
                style: CustomTextStyles.f14W400(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
        child: SizedBox(
          height: 55,
          child: CustomElevatedButton(
              title: "Submit",
              onTap: () {
                                      Get.offAll(() => DashScreen());

              }),
        ),
      ),
    );
  }
}
