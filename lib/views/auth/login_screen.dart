import 'package:aromize_app/controller/auth/login_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/validator.dart';
import 'package:aromize_app/views/auth/register_screen.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:aromize_app/widgets/custom/custom_password_fields.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 100),
          child: Form(
            key: c.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome Back",
                    style: CustomTextStyles.f32W600(),
                  ),
                ),
                Center(
                  child: Text(
                    "Enter your credential to login",
                    style: CustomTextStyles.f14W400(),
                  ),
                ),
                const SizedBox(height: 35),
                CustomTextField(
                    validator: Validators.checkEmailField,
                    controller: c.emailController,
                    preIconPath: Icons.email,
                    preIconSize: 18,
                    hint: "Enter your Email",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                Obx(() => CustomPasswordField(
                    validator: Validators.checkPasswordField,
                    hint: "Enter your password",
                    preIconPath: Icons.password,
                    preIconSize: 17,
                    eye: c.passwordObscure.value,
                    onEyeClick: c.onEyeCLick,
                    controller: c.passwordController,
                    textInputAction: TextInputAction.done)),
                const SizedBox(height: 15),
                Text(
                  "Forget Password?",
                  style: CustomTextStyles.f14W400(color: AppColors.textColor),
                ),
                const SizedBox(height: 25),
                CustomElevatedButton(
                    title: "Login",
                    onTap: () {
                      Get.offAll(() => DashScreen());
                    }),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => RegisterScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
