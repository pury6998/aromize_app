import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController{
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
}