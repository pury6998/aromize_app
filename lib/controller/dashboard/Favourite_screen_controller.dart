import 'package:get/get.dart';

class FavouriteScreenController extends GetxController {
  // Existing category selection (keep this)
  var selectedCategory = ''.obs;
  void toggleSelection(String category) {
    selectedCategory.value =
        (selectedCategory.value == category) ? '' : category;
  }

  // Existing payment selection (keep this)
  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  // New selection system for favorite items
  final RxList<bool> itemSelections = <bool>[].obs;
  final RxBool allSelected = false.obs;

  // Initialize with sample data (replace with your actual data later)
  void initializeSelections(int itemCount) {
    itemSelections.assignAll(List.generate(itemCount, (_) => false));
  }

  // Toggle individual item selection
  void toggleItemSelection(int index) {
    itemSelections[index] = !itemSelections[index];
    updateAllSelectedStatus();
  }

  // Toggle "Select All" functionality
  void toggleSelectAll() {
    allSelected.toggle();
    final newState = allSelected.value;
    itemSelections
        .assignAll(List.generate(itemSelections.length, (_) => newState));
  }

  // Helper to update "allSelected" status based on individual selections
  void updateAllSelectedStatus() {
    allSelected.value = itemSelections.isNotEmpty &&
        itemSelections.every((selected) => selected);
  }

  // Get selected item indices (useful for backend operations)
  List<int> get selectedIndices {
    return itemSelections
        .asMap()
        .entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
}
