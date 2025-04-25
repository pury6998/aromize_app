// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aromize_app/controller/auth/login_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:aromize_app/utils/validator.dart';
import 'package:aromize_app/views/auth/register_screen.dart';
import 'package:aromize_app/widgets/custom/custom_password_fields.dart';
import 'package:aromize_app/widgets/custom/custom_textfield.dart';
import 'package:aromize_app/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: Form(
                key: c.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with subtle animation
                    FadeInSlide(
                      delay: 0.2,
                      child: Column(
                        children: [
                          Text(
                            "Welcome Back",
                            style: CustomTextStyles.f32W600().copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Enter your credentials to login",
                            style: CustomTextStyles.f14W400().copyWith(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Email field with animation
                    FadeInSlide(
                      delay: 0.4,
                      child: CustomTextField(
                        validator: Validators.checkEmailField,
                        controller: c.emailController,
                        preIconPath: Icons.email_outlined,
                        preIconSize: 22,
                        hint: "Enter your Email",
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.emailAddress,
                        borderRadius: 12,
                        fillColor: Colors.grey[50],
                        borderColor: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password field with animation
                    FadeInSlide(
                      delay: 0.6,
                      child: Obx(() => CustomPasswordField(
                            validator: Validators.checkPasswordField,
                            hint: "Enter your password",
                            preIconPath: Icons.lock_outline,
                            preIconSize: 22,
                            eye: c.passwordObscure.value,
                            onEyeClick: c.onEyeCLick,
                            controller: c.passwordController,
                            textInputAction: TextInputAction.done,
                            fillColor: Colors.grey[50],
                          )),
                    ),
                    const SizedBox(height: 12),

                    // Forgot password with animation
                    FadeInSlide(
                      delay: 0.8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // Add forgot password functionality
                          },
                          child: Text(
                            "Forgot Password?",
                            style: CustomTextStyles.f14W400().copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login button with animation
                    FadeInSlide(
                      delay: 1.0,
                      child: CustomElevatedButton(
                        title: "Login",
                        onTap: () => c.onSubmit(),
                        height: 56,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Sign up section with floating animation
                    FadeInSlide(
                      delay: 1.2,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: CustomTextStyles.f14W400().copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 8),
                            FloatingSignUpButton(),
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
      ),
    );
  }
}

// Floating animated sign up button
class FloatingSignUpButton extends StatefulWidget {
  @override
  _FloatingSignUpButtonState createState() => _FloatingSignUpButtonState();
}

class _FloatingSignUpButtonState extends State<FloatingSignUpButton>
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
              Get.offAll(() => RegisterScreen());
            },
            child: Text(
              "Sign Up",
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

// Fade-in slide animation widget
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
      duration: const Duration(milliseconds: 600),
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
