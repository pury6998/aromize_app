import 'package:aromize_app/controller/auth/register_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/validator.dart';
import 'package:aromize_app/views/auth/email_verification_screen.dart';
import 'package:aromize_app/views/auth/login_screen.dart';
import 'package:aromize_app/widgets/custom/custom_password_fields.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final c = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:
                          Text("Sign Up", style: CustomTextStyles.f32W600())),
                  const SizedBox(height: 3),
                  Center(
                    child: Text("Create your account",
                        style: CustomTextStyles.f16W400()),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: c.fullNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      preIconPath: Icons.person,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkEmailField,
                      hint: "Enter your Email",
                      preIconPath: Icons.email,
                      preIconSize: 18,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Address",
                      preIconPath: Icons.house_sharp,
                      preIconSize: 21,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Enter Password",
                      eye: c.passwordObscure.value,
                      preIconSize: 17,
                      preIconPath: Icons.password,
                      onEyeClick: c.passwordOnEyeCLick,
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Enter Confirm Password",
                      eye: c.confirmObscure.value,
                      preIconPath: Icons.password,
                      preIconSize: 17,
                      onEyeClick: c.confirmPasswordOnEyeCLick,
                      controller: c.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.all(
                                  c.isChecked.value
                                      ? AppColors.primaryColor
                                      : AppColors.extraWhite),
                              value: c.isChecked.value,
                              onChanged: (bool? value) {
                                c.isChecked.value = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1.4,
                            child: Text(
                              "I agree with privacy policy",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.textColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                      title: "Sign Up",
                      onTap: () {
                        // //Get.offAll(()=>LogInScreen());
                        Get.offAll(() => EmailVerificationScreen());
                      }),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: CustomTextStyles.f14W400(
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
