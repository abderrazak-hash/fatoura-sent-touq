import 'package:cloud_toq_system/core/page/auth/recover_code_sent/recover_code_controller.dart';
import 'package:get/get.dart';

class RecoverCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoverCodeController>(
          () => RecoverCodeController(),
    );
  }
}