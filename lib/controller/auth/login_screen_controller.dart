import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreenController extends GetxController {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  RxBool passwordObscure = true.obs;
  RxBool isChecked = false.obs;

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }
}
