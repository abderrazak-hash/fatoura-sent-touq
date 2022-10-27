
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoryAddController extends GetxController{
  final TextEditingController categoryType = TextEditingController();
  final dropDownValueDepartment = 'القسم 1'.obs;
  final isSwitch = false.obs;
  final TextEditingController categoryName = TextEditingController();
  final TextEditingController discount = TextEditingController();
  final TextEditingController request = TextEditingController();
  final TextEditingController notes = TextEditingController();


  void setSelectedDepartment(value){
    dropDownValueDepartment.value = value;
  }
  void setSelectedSwitchTax(value){
    isSwitch.value = value;
  }


  var items = [
    'القسم 1',
    'القسم 2',
    'القسم 3',
    'القسم 4',
  ].obs;


  ///////// Camera //////
  var selectedImagePath = ''.obs;

  final imagePicker = ImagePicker();
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      print("No image selected");
    }
  }

  @override
  void onClose() {
    super.dispose();
    categoryType.dispose();
    categoryName.dispose();
    discount.dispose();
    request.dispose();
    notes.dispose();
  }

  save() {

    if(categoryType.value.text.isEmpty||categoryName.text.isEmpty
    ||discount.value.text.isEmpty||request.value.text.isEmpty
    ||notes.value.text.isEmpty){
      OverlayHelper.showErrorToast(AppText.requiredField);
      return;
    }
    if(dropDownValueDepartment.value.isEmpty){
      OverlayHelper.showErrorToast(AppText.requiredField);
      return;
    }
    // callLoginApi();
    Get.back();
  }

}
