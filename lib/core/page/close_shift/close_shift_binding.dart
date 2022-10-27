import 'package:cloud_toq_system/core/page/close_shift/close_shift_controller.dart';
import 'package:get/get.dart';

class CloseShiftBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CloseShiftController>(() => CloseShiftController());
  }



}