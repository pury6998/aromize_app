import 'dart:convert';

import 'package:aromize_app/controller/core_controller.dart';
import 'package:aromize_app/repo/register_repo.dart';
import 'package:aromize_app/utils/custom_snackbar.dart';
import 'package:aromize_app/utils/storage_keys.dart';
import 'package:aromize_app/views/dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool passwordObscure = false.obs;
  RxBool confirmObscure = false.obs;

  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();

  RxBool isChecked = false.obs;
  void passwordOnEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void confirmPasswordOnEyeCLick() {
    confirmObscure.value = !confirmObscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Creating account...");

      await RegisterRepo.register(
        name: fullNameController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneNoController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
          Get.find<CoreController>().loadCurrentUser();
          Get.offAll(() => DashScreen());
          CustomSnackBar.success(
              title: "Registration", message: "Account created successfully!");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Registration", message: message);
        },
      );
    }
  }
}
