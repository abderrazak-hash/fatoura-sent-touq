import 'package:cloud_toq_system/core/page/items/items_controller.dart';
import 'package:get/get.dart';

class ItemsBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ItemsController>(
          () => ItemsController(),
    );
  }

}