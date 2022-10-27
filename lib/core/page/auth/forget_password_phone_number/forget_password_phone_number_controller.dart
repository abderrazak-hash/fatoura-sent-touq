import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNumberController extends GetxController{

  var phoneNumber = ''.obs;


  onLoginClick() {
    // validate name
    if(!phoneNumber.value.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    // callLoginApi();
    Get.toNamed(Routes.RECOVER_CODE);
  }
}