import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController{

  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  onLoginClick() {
    // validate name
    if(!newPassword.value.isNotEmpty||!confirmPassword.value.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    // callLoginApi();
    Get.off(ProductListScreen());
  }

}