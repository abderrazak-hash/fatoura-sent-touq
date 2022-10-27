import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/onboarding/onboarding_controller.dart';
import 'package:cloud_toq_system/core/page/onboarding/widgets/OnboardingContents.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController controller = Get.find();
   OnBoardingScreen({Key? key}) : super(key: key);

  final _controller = PageController();


  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
       shape: BoxShape.circle,
        color:AppColors.current.primary,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
controller.save();
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Stack(
          children: [
            _buildBottomShapeDesign(),
            Obx((){
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Expanded(
                    flex: 4,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value){
                        controller.currentPage.value=value;
                      },
                      itemCount: contents.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                            top: 96,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                contents[i].image,
                                width: 300,
                                height: 270,
                              ),
                              Empty(height: 72,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contents.length,
                                      (int index) => _buildDots(index: index),
                                ),
                              ),
                              Empty(height: 16,),
                              Text(
                                contents[i].title,
                                textAlign: TextAlign.center,
                                style:const TextStyle(
                                  fontWeight: FontWeight.w700,
                                    fontFamily: 'Tajawal',
                                ),
                              ),
                              Empty(height: 16,),
                              Text(
                                contents[i].desc,
                                style:const TextStyle(
                                  fontWeight: FontWeight.w500,
                                    fontFamily: 'Tajawal',
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  controller.currentPage.value + 1 == contents.length
                      ? Padding(
                    padding: const EdgeInsets.only(bottom:24.0,
                        right: 16,left: 16
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        controller.save();
                        Get.offNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(343,48),
                        primary: AppColors.current.primary,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text("ابدأ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                            color: AppColors.current.neutral),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(bottom: 24,
                        right: 16,left: 16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _controller.jumpToPage(2);
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,

                          ),
                          child: Text(
                            "تخطى",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.dimmedLight),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const  Size(105,48),
                            primary: AppColors.current.primary,
                            shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 0,
                          ),
                          child: Text("التالى",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.neutral),
                          ),),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
  Positioned _buildBottomShapeDesign() => Positioned(
      left:-48,
     top: -48,
      child: Image.asset(
        AppAssets.onBoard,
        fit: BoxFit.cover,
      ));
}

