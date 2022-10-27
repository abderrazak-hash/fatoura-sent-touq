import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/items/items_view.dart';
import 'package:cloud_toq_system/core/page/language/settings_view.dart';
import 'package:cloud_toq_system/core/page/sales/receipts_view.dart';
import 'package:cloud_toq_system/core/page/settings/settings_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  final menuItems = <MenuItem>[].obs;

  var honorFilesExpanded = false.obs;
  var isSelected = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    initMenuItems();
  }

  void initMenuItems() {
    if (menuItems.isNotEmpty) menuItems.clear();

    /// == HOME
    menuItems.add(
        MenuItem(
        name: AppText.homePage,
        iconPath: AppAssets.buyPoints,
        onTap: () {
          Get.toNamed(Routes.HOME);
        }),
    );
    menuItems.add(
      MenuItem(
          name: AppText.sales,
          iconPath: AppAssets.list,
          onTap: () {
            Get.to(ReceiptsView());
          }),
    );
    menuItems.add(
      MenuItem(
          name: AppText.categories,
          iconPath: AppAssets.menu,
          onTap: () {
            Get.to(ItemsView());
          }),
    );
    menuItems.add(
      MenuItem(
          name: AppText.changeLang,
          iconPath: AppAssets.language,
          onTap: () {
            Get.to(LanguageView());
          }),
    );
    menuItems.add(
      MenuItem(
          name: AppText.settings,
          iconPath: AppAssets.settings,
          onTap: () {
            Get.to(SettingsView());
          }),
    );
    menuItems.add(
      MenuItem(
          name: AppText.logout,
          iconPath: AppAssets.logOut,
          onTap: () {
            Get.offNamed(Routes.LOGIN);
          }),
    );
    menuItems.add(
      MenuItem(
          name: 'الملف الشخصى',
          iconPath: AppAssets.man,
          onTap: () {
            Get.offNamed(Routes.PROFILE);
          }),
    );
  }
}
class MenuItem {
  String name;
  String? iconPath;
  VoidCallback onTap;
  bool? isExpandable;

  MenuItem({required this.name, this.iconPath, required this.onTap, this.isExpandable});
}
