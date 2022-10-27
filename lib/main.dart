import 'package:cloud_toq_system/core/common/theme/app_theme.dart';
import 'package:cloud_toq_system/core/common/translation/app_translations.dart';
import 'package:cloud_toq_system/core/page/branch/branch_view.dart';
import 'package:cloud_toq_system/core/page/payment/payment_view.dart';
import 'package:cloud_toq_system/core/page/product/product_binding.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const CloudToqSystem(),);
}

class CloudToqSystem extends StatelessWidget {
  const CloudToqSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cloud Toq System App',
      initialBinding: ProductBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: const Locale('ar', 'en'),
      fallbackLocale: const Locale('ar'),
      translations: AppTranslations(),
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
