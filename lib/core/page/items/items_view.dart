import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/items/items_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
   final ItemsController controller =Get.find();
   ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      drawer: SideMenuView(),
      appBar: _buildToolbar(),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.asset(AppAssets.background_app),
              Padding(
                padding: const EdgeInsets.only(top:64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap:()=>Get.toNamed(Routes.CATEGORY),
                        child: SvgPicture.asset(AppAssets.category)),
                    GestureDetector(
                        onTap:()=>Get.toNamed(Routes.DEPARTMENT),
                        child: SvgPicture.asset(AppAssets.section)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   AppBar _buildToolbar() {
     return AppBar(
       centerTitle: false,
       backgroundColor: AppColors.current.primary,
       leadingWidth: 40,
       elevation: 0.0,
       titleSpacing: 0,
       foregroundColor: AppColors.current.success,
       title:  Text('الأصناف',
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
}
