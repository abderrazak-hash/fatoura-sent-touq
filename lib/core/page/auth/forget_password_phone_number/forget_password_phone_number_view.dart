import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_phone_number/forget_password_phone_number_controller.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNumberView extends StatelessWidget {
  ForgetPasswordPhoneNumberView({Key? key}) : super(key: key);

  final controller = Get.put(ForgetPasswordPhoneNumberController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(AppAssets.background_app),
            _buildTopShapeDesign(),
            Padding(
              padding: const EdgeInsets.only(top: 170.0, right: 16, left: 16),
              child: Form(
                key: formKey,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.current.text, fontFamily: 'Tajawal'),
                    ),
                    Empty(height: 24,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'رقم الجوال',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.text, fontFamily: 'Tajawal'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 10,fontFamily: 'Tajawal'),

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                borderSide: BorderSide.none),
                            fillColor: AppColors.current.dimmed),
                        validator: RequiredValidator(errorText: AppText.requiredField),
                        onChanged: (val) => controller.phoneNumber.value = val,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: ()=>_onLogin(),
                      child: Text(
                        "إرسال",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.current.success),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(340, 52),
                        primary: AppColors.current.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'جرب طريقة أخرى',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.dimmedLight, fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
            _buildBottomShapeDesign(),
          ],
        ),
      ),
    );
  }

  Positioned _buildTopShapeDesign() => Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 300,
        height: 164,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppAssets.onBoard),
          fit: BoxFit.fill,
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 48, bottom: 24),
            child: SvgPicture.asset(
              AppAssets.logo1,
              height: 124,
              width: 124,
            ),
          ),
        ),
      ));

  Positioned _buildBottomShapeDesign() => Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 312,
        height: 164,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppAssets.onBoard2),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 116, right: 24),
          child: GestureDetector(
            onTap: () =>Get.toNamed(Routes.LOGIN),
            child: Text('العودة لتسجيل الدخولً',
                style: TextStyle(color: AppColors.current.success, fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Tajawal'),
                textAlign: TextAlign.right),
          ),
        ),
      ));
  _onLogin() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.onLoginClick();
    }

  }

}
