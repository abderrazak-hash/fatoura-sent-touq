import 'package:cloud_toq_system/core/page/items/category/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }

}