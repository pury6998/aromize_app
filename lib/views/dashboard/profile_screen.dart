// ignore_for_file: deprecated_member_use

import 'package:aromize_app/controller/core_controller.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'profile_edit.dart';
import 'home_screen.dart'; // Make sure to import your HomeScreen

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile-screen";
  final coreController = Get.put(CoreController());
  ProfileScreen({super.key});

  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEditScreen()),
    );
  }

  void _navigateToHomeScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DashScreen(), // Simple navigation without parameters
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "LOG OUT",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Add your logout functionality here later
                        coreController.logOut();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Logged out successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "LOG OUT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              imageUrl:
                                  coreController.currentUser.value?.image ?? "",
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: Colors.grey[200],
                      //     border: Border.all(
                      //       color: Colors.white,
                      //       width: 3,
                      //     ),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withOpacity(0.1),
                      //         blurRadius: 8,
                      //         offset: const Offset(0, 2),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Icon(
                      //     Icons.person,
                      //     size: 40,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => _navigateToEditProfile(context),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 2, 219, 41),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            "${coreController.currentUser.value!.name}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () => Text(
                            "${coreController.currentUser.value!.email}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _navigateToEditProfile(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 26, 26, 26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              elevation: 2,
                            ),
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Profile Options
            _buildSectionTitle("General"),
            _buildProfileOption(
              icon: "assets/icons/terms.svg",
              title: "Terms and Conditions",
              onTap: () => _navigateToHomeScreen(context, "Terms"),
            ),
            _buildProfileOption(
              icon: "assets/icons/about.svg",
              title: "About Us",
              onTap: () => _navigateToHomeScreen(context, "About"),
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),

            _buildSectionTitle("Support"),
            _buildProfileOption(
              icon: "assets/icons/help.svg",
              title: "Help Center",
              onTap: () => _navigateToHomeScreen(context, "Help"),
            ),
            _buildProfileOption(
              icon: "assets/icons/rate.svg",
              title: "Rate App",
              onTap: () {
                // Keep your rate app dialog if needed
              },
            ),
            _buildProfileOption(
              icon: "assets/icons/share.svg",
              title: "Share App",
              onTap: () {
                // Keep your share app dialog if needed
              },
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),

            _buildProfileOption(
              icon: "assets/icons/history.svg",
              title: "Purchase History",
              onTap: () => _navigateToHomeScreen(context, "History"),
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),

            _buildProfileOption(
              icon: "assets/icons/logout.svg",
              title: "Log Out",
              isWarning: true,
              onTap: () => _showLogoutConfirmation(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required String icon,
    required String title,
    bool isWarning = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.05),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 22,
                  width: 22,
                  color: isWarning ? Colors.red : Colors.black,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isWarning ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: isWarning ? Colors.red : Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
