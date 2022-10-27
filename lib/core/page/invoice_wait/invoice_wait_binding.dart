import 'package:cloud_toq_system/core/page/invoice_wait/invoice_wait_controller.dart';
import 'package:get/get.dart';

class InvoiceWaitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceWaitController>(
          () => InvoiceWaitController(),
    );
  }
}