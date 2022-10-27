import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/profile/profile_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        drawer: SideMenuView(),
        appBar: _buildToolbar(),
        body: Center(
          child: Column(
            children: [
              Obx(() => Image.network(controller.avatar.value)),
              Obx(
                () => Text(
                  controller.userName.value,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      color: AppColors.current.success),
                ),
              ),
              Obx(
                () => Text(
                  controller.email.value,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      color: AppColors.current.success),
                ),
              ),
              Obx(
                () => Text(
                  controller.mobile.value,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      color: AppColors.current.success),
                ),
              ),
            ],
          ),
        ));
  }
  AppBar _buildToolbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.current.primary,
      leadingWidth: 40,
      elevation: 0.0,
      titleSpacing: 0,
      foregroundColor: AppColors.current.success,
      title:  Text('الملف الشخصى',
        style: TextStyle(
            color: AppColors.current.success,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Tajawal'
        ),
      ),
      actions: [
        GestureDetector(child: Icon(Icons.arrow_forward,
          size: 30,
          color: AppColors.current.success,),
          onTap:()=>Get.back(),
        ),
      ],

    );
  }
}
