// ignore_for_file: deprecated_member_use
import 'package:aromize_app/controller/dashboard/dash_screen_controller.dart';
import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashScreen extends StatelessWidget {
  static String routeName = "/dash-screen";
  final c = Get.put(DashScreenController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: Obx(() => c.pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
              color: AppColors.backGroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.extraWhite,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.unselectedGrey,
              type: BottomNavigationBarType.fixed,
              currentIndex: c.currentIndex.value,
              onTap: c.onItemTapped,
              showSelectedLabels: false, // Remove label text
              showUnselectedLabels: false, // Remove label text
              iconSize: 26,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagePath.home,
                    color: c.currentIndex.value == 0
                        ? AppColors.primaryColor
                        : AppColors.unselectedGrey,
                    height: 24,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagePath.heart,
                    color: c.currentIndex.value == 1
                        ? AppColors.rejected
                        : AppColors.unselectedGrey,
                    height: 24,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagePath.cart,
                    color: c.currentIndex.value == 2
                        ? AppColors.primaryColor
                        : AppColors.unselectedGrey,
                    height: 24,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagePath.setting, // Updated icon path if different
                    color: c.currentIndex.value == 3
                        ? AppColors.primaryColor
                        : AppColors.unselectedGrey,
                    height: 28,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    ImagePath.mail, // Updated icon path if different
                    color: c.currentIndex.value == 4
                        ? AppColors.primaryColor
                        : AppColors.unselectedGrey,
                    height: 24,
                  ),
                  label: "",
                ),
              ],
            ),
          )),
    );
  }
}
