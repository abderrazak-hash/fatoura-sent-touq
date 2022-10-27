import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:flutter/material.dart';


class AppToolbar extends StatelessWidget {
  final String title;
  Function? backCallBack;
  Function? drawerCallBack;
  Widget? actions;

  AppToolbar({Key? key, required this.title, this.backCallBack, this.drawerCallBack, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
        style: const TextStyle(fontSize: 18,fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
      actions: [
        /// back button
        if (backCallBack != null)
          IconButton(
              onPressed: () => backCallBack!(),
              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.current.success,
                size: 20,
              ))
        else if (drawerCallBack != null)
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              onPressed: () => drawerCallBack!(),
              icon: Icon(
                Icons.menu,
                color: AppColors.current.accent,
                size: 25,
              ),
          )
        else
          const SizedBox(
            width: 16,
          ),

        actions??const SizedBox()
      ],

    );
  }
}
