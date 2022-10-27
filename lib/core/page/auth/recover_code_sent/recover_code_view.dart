import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/theme/app_theme.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_phone_number/forget_password_phone_number_controller.dart';
import 'package:cloud_toq_system/core/page/auth/recover_code_sent/recover_code_controller.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RecoverCodeView extends StatelessWidget {
  RecoverCodeView({Key? key}) : super(key: key);

  final controller = Get.put(RecoverCodeController());
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
              child: Center(
                  child: Form(
                    key: formKey,
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
                        'كود التأكيد',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.text, fontFamily: 'Tajawal'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:16.0,bottom: 16),
                      child: PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        validator: (value){
                          if (value!.isEmpty) {
                            return "من فضلك ادخل ال 6 ارقام";
                          } else {
                            return null;
                          }
                        },
                        animationType: AnimationType.fade,
                        cursorColor: AppColors.current.dimmedLight,
                        pinTheme: PinTheme(
                          inactiveFillColor: AppColors.current.dimmedLight.withOpacity(0.1),
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 52,
                          fieldWidth: 52,
                          activeFillColor: AppColors.current.dimmedLight.withOpacity(0.05),
                          selectedColor: AppColors.current.dimmedLight.withOpacity(0.05),
                          activeColor: AppColors.current.dimmedLight.withOpacity(0.05),
                          inactiveColor: AppColors.current.dimmedLight.withOpacity(0.05),
                          borderWidth: 1,
                         selectedFillColor: AppColors.current.primary
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,

                        controller: controller.textEditController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);

                            var currentText = value;

                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>_onLogin(),
                      child: Text(
                        "تأكيد",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.current.success, fontFamily: 'Tajawal'),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(340, 52),
                        primary: AppColors.current.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>Get.toNamed(Routes.FORGET_PASSWORD),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'لم يصلني  الرمز !',
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.dimmedLight, fontFamily: 'Tajawal'),
                            ),
                          ),
                        ),
                      ],
                    ),

                ],
              ),
                  )),
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
                style: TextStyle(color: AppColors.current.success, fontWeight: FontWeight.w700, fontSize: 18),
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
