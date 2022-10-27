import 'package:cloud_toq_system/core/page/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }

}