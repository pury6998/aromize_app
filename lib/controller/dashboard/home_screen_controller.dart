import 'package:aromize_app/models/Category.dart';
import 'package:aromize_app/repo/get_category_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final dateKeys = GlobalKey<FormState>();
  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  RxBool loading = RxBool(false);
  RxList<Category> allCategoryList = <Category>[].obs;

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }

  getAllCategory() async {
    loading.value = true;

    await AllCategoryRepo.getAllCategory(onSuccess: (categories) {
      loading.value = false;
      allCategoryList.addAll(categories);
    }, onError: ((message) {
      loading.value = false;
      //CustomSnackBar.error(title: "Category", message: message);
    }));
  }
}
