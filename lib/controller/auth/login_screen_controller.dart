import 'dart:convert';

import 'package:aromize_app/controller/core_controller.dart';
import 'package:aromize_app/repo/login_repo.dart';
import 'package:aromize_app/utils/custom_snackbar.dart';
import 'package:aromize_app/utils/storage_keys.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  void onSubmit() async {
    if (key.currentState!.validate()) {
      loading.show(message: "Please wait...");
      await LoginRepo.login(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: (user, token) async {
            loading.hide();
            final box = GetStorage();
            box.write(StorageKeys.USER, json.encode(user.toJson()));
            await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(() => DashScreen());
            CustomSnackBar.success(title: "Login", message: "Login Successful");
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Login", message: message);
          });
    }
  }
}
