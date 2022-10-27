import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/add_customer/add_customer_controller.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class AddCustomerView extends StatelessWidget {
  final AddCustomerController controller = Get.find();
   AddCustomerView({Key? key}) : super(key: key);
   final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildToolbar(),
      body: Stack(
        children: [
          Image.asset(AppAssets.background_app),
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Empty(
                          height: 10,
                        ),
                        _buildTextFormFieldName(),
                        Empty(height: 8,),
                        _buildTextFormFieldEmail(),
                        Empty(height: 8,),
                        _buildTextFormFieldAddress(),
                        Empty(height: 8,),
                        _buildTextFormFieldPhoneNumber(),
                        Empty(height: 8,),
                        _buildTextFormFieldStartBalanceHave(),
                        Empty(height: 8,),
                        _buildTextFormFieldStartBalanceNotHave(),
                        Empty(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0,bottom: 8),
                          child: Text("ملاحظات",style: TextStyle(
                              color: AppColors.current.text,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Tajawal',
                              fontSize: 16.0
                          ),
                          ),
                        ),
                        _buildTextFormFieldNotes(),
                        Empty(height: 24,),
                        Center(
                          child: ElevatedButton(
                            onPressed: ()=>onOk(),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(340,52),
                              shape:  RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text('تأكيد',
                              style: TextStyle(
                                  color: AppColors.current.success,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                        Empty(height: 24,)
                      ],
                    ),
                  ),
                ),
              ),

        ],
      ),
    );
  }
  AppBar _buildToolbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.current.primary,
      elevation: 0.0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      foregroundColor: AppColors.current.success,
      title:  Text('إضافة عميل',
        style: TextStyle(
            color: AppColors.current.success,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Tajawal'
        ),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_forward,
            size: 36,
            color: AppColors.current.success,),
          ),
          onTap:()=>Get.back(),
        ),
      ],

    );
  }
  Widget _buildTextFormFieldName(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'اسم العميل',
          hintStyle: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.customerName.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldEmail(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'الإيميل',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.email.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldAddress(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'العنوان',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.address.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldPhoneNumber(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'رقم الجوال',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.phoneNumber.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldStartBalanceHave(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'رصيد بداية له',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.amountBeginTo.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldStartBalanceNotHave(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'رصيد بداية علية',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.amountBeginIn.value = val,
      ),
    );
  }
  Widget _buildTextFormFieldNotes(){
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor:AppColors.current.dimmed.withOpacity(0.75),
          hintText: 'ملاحظات',
          hintStyle: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.current.text.withOpacity(0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
                color: Colors.transparent, width: 0.0),
          ),
          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),
        ),
        validator: RequiredValidator(errorText: AppText.requiredField,),
        onChanged: (val) => controller.notes.value = val,
        maxLines: 4,
      ),
    );
  }


  onOk() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.onOkClick();
    }
  }
}
