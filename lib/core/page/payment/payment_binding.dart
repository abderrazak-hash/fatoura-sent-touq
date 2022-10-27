import 'package:cloud_toq_system/core/page/payment/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<PaymentController>(
          () => PaymentController(),
    );
  }

}