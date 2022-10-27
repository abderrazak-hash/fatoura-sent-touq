import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:flutter/material.dart';


class DotsView extends StatelessWidget {
  final Function onClick;
  const DotsView({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onClick(),
      child: SizedBox(
        width: 25,height: 25,
        child:Icon(Icons.arrow_forward,
        size: 36,
        color: AppColors.current.success,),
      ),
    );
  }
}
