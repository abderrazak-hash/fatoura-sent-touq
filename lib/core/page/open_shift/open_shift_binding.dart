import 'package:cloud_toq_system/core/page/open_shift/open_shift_controller.dart';
import 'package:get/get.dart';

class OpenShiftBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OpenShiftController>(() => OpenShiftController());
  }



}