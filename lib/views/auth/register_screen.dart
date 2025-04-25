import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aromize_app/controller/auth/register_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/validator.dart';
import 'package:aromize_app/views/auth/login_screen.dart';
import 'package:aromize_app/widgets/custom/custom_password_fields.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final c = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: c.formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with animation
                  FadeInSlide(
                    delay: 0.2,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Create Account",
                            style: CustomTextStyles.f32W600().copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Fill in your details to get started",
                            style: CustomTextStyles.f16W400().copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Full Name field with animation
                  FadeInSlide(
                    delay: 0.3,
                    child: CustomTextField(
                      controller: c.fullNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      preIconPath: Icons.person_outline,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      borderRadius: 12,
                      fillColor: Colors.grey[50],
                      borderColor: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email field with animation
                  FadeInSlide(
                    delay: 0.4,
                    child: CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkEmailField,
                      hint: "Enter your Email",
                      preIconPath: Icons.email_outlined,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      fillColor: Colors.grey[50],
                      borderColor: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInSlide(
                    delay: 0.4,
                    child: CustomTextField(
                      controller: c.phoneNoController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Phone Number",
                      preIconPath: Icons.phone,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.phone,
                      borderRadius: 12,
                      fillColor: Colors.grey[50],
                      borderColor: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Address field with animation
                  FadeInSlide(
                    delay: 0.5,
                    child: CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Address",
                      preIconPath: Icons.home_outlined,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.streetAddress,
                      borderRadius: 12,
                      fillColor: Colors.grey[50],
                      borderColor: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password field with animation
                  FadeInSlide(
                    delay: 0.6,
                    child: Obx(
                      () => CustomPasswordField(
                        validator: Validators.checkPasswordField,
                        hint: "Enter Password",
                        eye: c.passwordObscure.value,
                        preIconSize: 22,
                        preIconPath: Icons.lock_outline,
                        onEyeClick: c.passwordOnEyeCLick,
                        controller: c.passwordController,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password field with animation
                  FadeInSlide(
                    delay: 0.7,
                    child: Obx(
                      () => CustomPasswordField(
                        validator: (value) => Validators.checkConfirmPassword(
                            value, c.passwordController.text),
                        hint: "Confirm Password",
                        eye: c.confirmObscure.value,
                        preIconPath: Icons.lock_outline,
                        preIconSize: 22,
                        onEyeClick: c.confirmPasswordOnEyeCLick,
                        controller: c.confirmPasswordController,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Terms checkbox with animation
                  FadeInSlide(
                    delay: 0.8,
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            checkColor: Colors.white,
                            fillColor: WidgetStateProperty.all(
                              c.isChecked.value
                                  ? AppColors.primaryColor
                                  : Colors.grey[300],
                            ),
                            value: c.isChecked.value,
                            onChanged: (bool? value) {
                              c.isChecked.value = value!;
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              c.isChecked.value = !c.isChecked.value;
                            },
                            child: Text(
                              "I agree with the Terms & Conditions and Privacy Policy",
                              style: CustomTextStyles.f14W400().copyWith(
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign Up button with animation
                  FadeInSlide(
                    delay: 0.9,
                    child: CustomElevatedButton(
                      title: "Sign Up",
                      onTap: () {
                        c.onSubmit();
                      },
                      height: 56,
                      textStyle: CustomTextStyles.f16W600().copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Login link with floating animation
                  FadeInSlide(
                    delay: 1.1,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: CustomTextStyles.f14W400().copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 8),
                          FloatingLoginButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Floating animated login button
class FloatingLoginButton extends StatefulWidget {
  @override
  _FloatingLoginButtonState createState() => _FloatingLoginButtonState();
}

class _FloatingLoginButtonState extends State<FloatingLoginButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: InkWell(
            onTap: () {
              Get.offAll(() => LoginScreen());
            },
            child: Text(
              "Login",
              style: CustomTextStyles.f14W400().copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                shadows: [
                  Shadow(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Reuse the same FadeInSlide widget from login screen
class FadeInSlide extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeInSlide({
    required this.delay,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: (600 + delay * 300).round()),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
