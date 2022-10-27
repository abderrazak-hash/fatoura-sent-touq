import 'package:cloud_toq_system/core/page/add_customer/add_customer_controller.dart';
import 'package:get/get.dart';

class AddCustomerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddCustomerController>(() => AddCustomerController());
  }

}