import 'package:cloud_toq_system/core/page/item_name/item_name_controller.dart';
import 'package:get/get.dart';

class ItemNameBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ItemNameController>(
          () => ItemNameController(),
    );
  }

}