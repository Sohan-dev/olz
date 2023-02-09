import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:olz/apiModule/apiService.dart';
import 'package:olz/models/product/productModel.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProductList();
    super.onInit();
  }

  void fetchProductList() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      print(products);
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
