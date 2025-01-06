import 'package:get/get.dart';

class ShopScreenController extends GetxController {
  var selectedCategory = ''.obs;

  void toggleSelection(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect if already selected
    } else {
      selectedCategory.value = category;
    }
  }

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }
}
