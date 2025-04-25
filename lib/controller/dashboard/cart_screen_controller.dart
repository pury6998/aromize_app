import 'package:get/get.dart';

class MyCartScreenController extends GetxController {
  // Tracking count for individual cart items (productId as the key)
  var cartItems = <int, RxInt>{}.obs; // {productId: count}

  void increment(int productId) {
    if (cartItems.containsKey(productId)) {
      cartItems[productId]!.value++;
    } else {
      cartItems[productId] = 1.obs;
    }
  }

  void decrement(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]!.value > 0) {
      cartItems[productId]!.value--;
    }
  }

  // Selection state for individual items
  var selectedItems = <int, RxBool>{}.obs; // {productId: isSelected}

  void toggleSelection(int productId) {
    if (selectedItems.containsKey(productId)) {
      selectedItems[productId]!.value = !selectedItems[productId]!.value;
    } else {
      selectedItems[productId] = true.obs; // Default to selected if not in map
    }
  }

  // Selection state for "Select All" feature
  var isSelectedAll = false.obs;

  void toggleSelectionAll() {
    isSelectedAll.value = !isSelectedAll.value;
    if (isSelectedAll.value) {
      // Mark all items as selected
      selectedItems.forEach((key, value) {
        value.value = true;
      });
    } else {
      // Deselect all items
      selectedItems.forEach((key, value) {
        value.value = false;
      });
    }
  }

  // Check if all items are selected
  bool get areAllSelected => selectedItems.values.every((element) => element.value);
}
