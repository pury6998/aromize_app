import 'package:aromize_app/utils/colors.dart';
import 'package:aromize_app/utils/custom_text_style.dart';
import 'package:flutter/material.dart';

class NotifcationScreen extends StatelessWidget {
  const NotifcationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.extraWhite,
          title: Text("Notification",
              style: CustomTextStyles.f16W400(color: AppColors.textColor))),
    );
  }
}
