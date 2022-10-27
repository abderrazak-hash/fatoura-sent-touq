import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animationTween;
  double size = 10;

  @override
  void onInit() {
    super.onInit();

    save();
    animate();
    onTap();
    _onLoad();

  }

  void animate() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    final curvedAnimation = CurvedAnimation(parent: _controller!, curve: Curves.easeInToLinear);
    Tween<double> tween = Tween<double>(begin: 10.0, end: 200.0);
    animationTween = tween.animate(curvedAnimation)
      ..addListener(() {
        size = animationTween!.value;
      });
  }

  void onTap() {
    if (_controller!.status == AnimationStatus.completed) {
      _controller!.reverse();
    } else {
      _controller!.forward();
    }
    _controller!.dispose();
  }

  void _onLoad() async {
    await Future.delayed(const Duration(seconds: 4));
    _navigateNoNextPage();
  }

  _navigateNoNextPage() {
    Get.offAllNamed(Routes.ONBOARDING_VIEW);
  }

@override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void save()async{
    sharedPreferences!.setBool('splash', true);
  }
}
