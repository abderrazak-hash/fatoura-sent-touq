import 'package:cloud_toq_system/core/page/sales/receipts_controller.dart';
import 'package:get/get.dart';

class ReceiptsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReceiptsController>(() => ReceiptsController());
  }

}