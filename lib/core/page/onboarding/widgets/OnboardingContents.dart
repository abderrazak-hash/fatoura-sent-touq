import 'package:flutter/material.dart';

class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "تحكم في المخزون",
    image: "assets/images/board1.png",
    desc: "تحكم بجميع منتجاتك في المخزن, وقم بإدارة الصادر والوارد بشكل سهل وسريع",
  ),
  OnBoardingContents(
    title: "أصدر الفواتير",
    image: "assets/images/board2.png",
    desc:
        "تمم مبيعاتك وأصدر الفواتير لعملائك بشكل أسهل ,اسرع من قبل",
  ),
  OnBoardingContents(
    title: "طرق دفع متعددة",
    image: "assets/images/board3.png",
    desc:
        "يمكنك الآن الجدفع من خلال البطاقة البنكية بخطوات بسيطة وسهلة في حال لا تريد الدفع التقليدي",
  ),
];