import 'package:cloud_toq_system/core/page/invoice_items/invoice_items_controller.dart';
import 'package:get/get.dart';

class InvoiceItemsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<InvoiceItemsController>(() =>
        InvoiceItemsController());
  }


}