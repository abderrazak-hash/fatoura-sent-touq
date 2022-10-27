import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.find();
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return _buildBody();
  }

  Widget _buildBody() {
    return SafeArea(
      child:  Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(AppAssets.splash1),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.current.logo.withOpacity(0.5),
                      AppColors.current.logo.withOpacity(0.6),
                      AppColors.current.logo.withOpacity(0.8),
                      AppColors.current.logo.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(AppAssets.logo1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 136),
              child: Center(
                child: Container(
                  color: AppColors.current.neutral,
                  width: controller.size,
                  height: 4,
                ),
              ),
            ),
          ],
      ),
        );

  }
}
