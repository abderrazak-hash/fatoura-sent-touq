import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class CategoryItem extends StatelessWidget {
  final ProductElement product;
   CategoryItem({Key? key,required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: AppColors.current.primary,
          ),
        ),
        child: Column(
          children: [
             Obx((){
             return  Padding(
               padding:  EdgeInsets.symmetric(
                   horizontal: product.isExpanded.value? 8:4
               ),
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: Container(
                       width: 44,
                       height: 44,
                       alignment: Alignment.center,
                       padding: const EdgeInsets.only(top: 6),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                          color: Colors.blueAccent
                          //color: category.color,
                       ),
                     ),
                   ),
                   Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           product.name!,
                           style:  TextStyle(fontSize: 16,
                               fontFamily: 'Tajawal',
                               fontWeight: FontWeight.w500,
                               color: AppColors.current.text
                           ),
                         ),
                         Row(
                           children: [
                             Text(
                               product.price!,
                               style:  TextStyle(fontSize: 12,
                                   fontFamily: 'Tajawal',
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.current.dimmedLight),
                             ),
                             const Padding(
                               padding:  EdgeInsets.symmetric(horizontal: 4.0),
                               child:  Text('-'),
                             ),
                             Text(
                               product.unityName!,
                               style:  TextStyle(fontSize: 12,
                                   fontFamily: 'Tajawal',
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.current.dimmedLight),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                   const Spacer(flex: 1,),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text(
                         product.price!,
                         style:  TextStyle(fontSize: 16,
                             fontFamily: 'Tajawal',
                             fontWeight: FontWeight.w700,
                             color: AppColors.current.primary
                         ),
                       ),
                       Obx(() {
                         return InkWell(
                             onTap: (){
                               product.isExpanded.value = !product.isExpanded.value;
                             },
                             child: Icon(product.isExpanded.value? CupertinoIcons.chevron_up:CupertinoIcons.chevron_down, color: AppColors.current.text, size: 24,));
                       }),
                     ],
                   ),
                 ],
               ),
             );
           }),
             Obx((){
             return  Visibility(
               visible: product.isExpanded.value,
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                     child: Divider(
                       color: AppColors.current.dimmedLight.withOpacity(0.3),
                       height: 1,
                       indent: 10,
                       thickness: 1,
                       endIndent: 10,
                     ),
                   ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('القسم:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(product.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('نوع المنتج:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(product.unityName!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Text('سعر الشراء:  ',
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 fontFamily: 'Tajawal',
                                 color: AppColors.current.text,
                               ),
                             ),
                             Text(product.price!,
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 fontFamily: 'Tajawal',
                                 color: AppColors.current.primary,
                               ),
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Text('سعر البيع:  ',
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 fontFamily: 'Tajawal',
                                 color: AppColors.current.text,
                               ),
                             ),
                             Text(product.priceBuy.toString(),
                               style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 fontFamily: 'Tajawal',
                                 color: AppColors.current.primary,
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text('حد الطلب',
                         style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 14,
                           fontFamily: 'Tajawal',
                           color: AppColors.current.text,
                         ),
                       ),
                       Empty(width: 8,),
                       Text('30',
                         style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 14,
                           fontFamily: 'Tajawal',
                           color: AppColors.current.primary,
                         ),
                       )
                     ],
                   )
                 ],
               ),
             );
           }),
          ],
        ),
      ),
    );
  }
}
