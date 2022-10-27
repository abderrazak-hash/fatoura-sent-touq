import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ProductController>(() => ProductController());
  }
}