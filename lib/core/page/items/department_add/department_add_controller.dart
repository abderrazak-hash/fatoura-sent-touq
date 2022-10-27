import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentAddController extends GetxController{
  final TextEditingController departmentName = TextEditingController();

  @override
  void onClose() {
    super.dispose();
    departmentName.dispose();
  }

  save() {

    if(departmentName.value.text.isEmpty){
      OverlayHelper.showErrorToast(AppText.requiredField);
      return;
    }
    // callLoginApi();
    Get.back();
  }

}
