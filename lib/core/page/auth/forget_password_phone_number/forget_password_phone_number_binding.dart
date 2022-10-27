import 'package:cloud_toq_system/core/page/auth/forget_password_phone_number/forget_password_phone_number_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordPhoneNumberController>(
          () => ForgetPasswordPhoneNumberController(),
    );
  }
}