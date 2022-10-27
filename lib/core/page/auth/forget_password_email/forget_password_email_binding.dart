import 'package:cloud_toq_system/core/page/auth/forget_password_email/forget_password_email_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordEmailController>(
          () => ForgetPasswordEmailController(),
    );
  }
}