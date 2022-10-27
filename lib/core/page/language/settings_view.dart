import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      appBar: AppBar(
        title: Text('اللغات',
          style: TextStyle(
              fontFamily: 'Cairo',
              color: AppColors.current.neutral,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Text('لا توجد نتائج',
            style: TextStyle(
              fontFamily: 'Cairo',
              color: AppColors.current.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
            )),
      ),
    );
  }
}
