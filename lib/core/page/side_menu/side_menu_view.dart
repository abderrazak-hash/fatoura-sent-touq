import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/widgets/3dots_view.dart';
import 'package:cloud_toq_system/core/page/close_shift/close_shift_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'side_menu_controller.dart';

class SideMenuView extends StatelessWidget {
  final controller = Get.put(SideMenuController());
   SideMenuView({Key? key}) : super(key: key);

   bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.current.neutral,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(AppAssets.background_app),
          Column(
            children: [
              _buildUserData(),
              Empty(height: 24,),
              _buildMenuList(context),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildUserData() {
    return Container(
      color: AppColors.current.primary,
      height: 124,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 36, bottom: 15, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const Spacer(flex: 1,),
                  Text('اسم المالك',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                        color: AppColors.current.success,
                        fontSize: 18),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis),
                 Text('اسم  نفطة البيع',
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                         color: AppColors.current.success,
                        fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            const Spacer(flex: 1,),
            DotsView(
                onClick: () {
              Get.back();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              _buildMenuItem(image: AppAssets.pointBuy, function: ()=>Get.back()),
              _buildMenuItem(image: AppAssets.sales, function: ()=>Get.toNamed(Routes.RECEIPTS)),
              _buildMenuItem(image: AppAssets.category, function: ()=>Get.toNamed(Routes.ITEMS)),
            ],
          ),
          Row(

            children: [
              _buildMenuItem(image: AppAssets.translate, function: (){}),
              _buildMenuItem(image: AppAssets.setting, function: (){}),
              _buildMenuItem(image: AppAssets.logout, function: (){
                sharedPreferences!.remove('id').then((value) => Get.offNamed(Routes.LOGIN));
              }),
            ],
          ),
          Row(

            children: [
    GestureDetector(
    onTap: ()=>Get.to(CloseShiftView()),
    child: Image.asset(AppAssets.bran,fit: BoxFit.contain,),
    ),
            ],
          ),
          // Row(
          //
          //   children: [
          //     _buildMenuItem(image: AppAssets.man, function: ()=>Get.toNamed(Routes.PROFILE)),
          //   ],
          // ),
          Divider(color: AppColors.current.dimmedLight.withOpacity(0.3),height: 0.5,endIndent: 36,indent: 36,thickness: 0.5,),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required String image,required VoidCallback function}){
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: SvgPicture.asset(image,fit: BoxFit.contain,),
      ),
    );
  }
}
