import 'package:get/get.dart';

class MyCartScreenController extends GetxController{
  var count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }
  
  var isSelected = false.obs;

  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }
  var isSelectedAll = false.obs;

  void toggleSelectionAll() {
    isSelectedAll.value = !isSelectedAll.value;
  }
}