import 'package:cloud_toq_system/core/page/shiftting/shift_controller.dart';
import 'package:get/get.dart';

class ShiftBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ShiftController>(() => ShiftController());
  }


}