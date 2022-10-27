import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/theme/app_theme.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/auth/login/login_controller.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

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
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.current.text, fontFamily: 'Tajawal'),
                    ),
                    Empty(height: 24,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'اسم المستخدم',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.text, fontFamily: 'Tajawal'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 4),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
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
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        onChanged: (val) => controller.userName.value = val,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'كلمة المرور',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.text, fontFamily: 'Tajawal'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 16),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
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
                        onChanged: (val) => controller.password.value = val,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: ()=>_onLogin(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(340, 52),
                        primary: AppColors.current.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.current.success, fontFamily: 'Tajawal'),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>Get.toNamed(Routes.FORGET_PASSWORD),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'نسيت كلمة المرور',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.current.dimmedLight, fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
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
          padding: const EdgeInsets.only(top: 124, right: 24),
          child: Text('أنشئ حساباً جديداً',
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: AppColors.current.success, fontWeight: FontWeight.w700, fontSize: 18),
              textAlign: TextAlign.right,),
        ),
      ));


  _onLogin() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.onLoginClick();
    }
  }
}
