import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/items/department/department_controller.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:flutter/material.dart';


class DepartmentItem extends StatelessWidget {
  final Category department;
   DepartmentItem({Key? key,required this.department}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.current.neutral,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
                leading: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                   child: Container(
                     width: 58,
                     height: 58,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                      // color: department.color,
                        color: Colors.green,
                     ),
                   ),
                 ),
                 title:Text(department.name!,
                   style: TextStyle(
                     fontWeight: FontWeight.w400,
                     fontSize: 16,
                     fontFamily: 'Tajawal',
                     color: AppColors.current.text,
                   ),
                 ),
                 subtitle:Text(
                   // department.number!.toString(),
                   department.activityId!.toString(),
                   style: TextStyle(
                     fontWeight: FontWeight.w400,
                     fontSize: 12,
                     fontFamily: 'Tajawal',
                     color: AppColors.current.dimmedLight,
                   ),
                 ),


             ),
           );
         }

}
