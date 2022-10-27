import 'package:cloud_toq_system/core/page/items/category_add/category_add_controller.dart';
import 'package:get/get.dart';

class CategoryAddBinding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut<CategoryAddController>(() => CategoryAddController());
  }

}