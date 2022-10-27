import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverCodeController extends GetxController{

  final textEditController = TextEditingController();


  onLoginClick() {
    // validate name
    if(!textEditController.text.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    // callLoginApi();
    Get.off(ProductListScreen());
  }

}