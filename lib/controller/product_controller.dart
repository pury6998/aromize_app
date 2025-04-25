import 'package:aromize_app/models/product.dart';
import 'package:aromize_app/repo/get_product_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<GetProduct> allProductsList = <GetProduct>[].obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    loading.value = true;

    await ProductRepo.getProduct(onSuccess: (products) {
      loading.value = false;
      allProductsList.addAll(products);
    }, onError: ((message) {
      loading.value = false;
      //CustomSnackBar.error(title: "Category", message: message);
    }));
  }
}
