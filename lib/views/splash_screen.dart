import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aromize_app/controller/dashboard/splash_screen_controller.dart';
import 'package:aromize_app/utils/image_path.dart';
import 'package:aromize_app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Enlarged animated logo with fade-in and scale effect
            AnimatedSplashLogo(),
            const SizedBox(height: 50),
            // Smooth loading indicator with custom animation
            AnimatedLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}

class AnimatedSplashLogo extends StatefulWidget {
  @override
  _AnimatedSplashLogoState createState() => _AnimatedSplashLogoState();
}

class _AnimatedSplashLogoState extends State<AnimatedSplashLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              // Enlarged logo size (changed from Get.width / 2.5 to Get.width / 2)
              width: Get.width / 2,
              child: Image.asset(ImagePath.logo),
            ),
          ),
        );
      },
    );
  }
}

// The AnimatedLoadingIndicator class remains exactly the same
class AnimatedLoadingIndicator extends StatefulWidget {
  @override
  _AnimatedLoadingIndicatorState createState() =>
      _AnimatedLoadingIndicatorState();
}

class _AnimatedLoadingIndicatorState extends State<AnimatedLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
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
        return SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            value: _animation.value,
            strokeWidth: 3,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        );
      },
    );
  }
}
