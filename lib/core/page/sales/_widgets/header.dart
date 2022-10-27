import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/sales/receipts_controller.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common/theme/app_assets.dart';


class Header extends StatelessWidget {
  final Sales receipts;
   Header({Key? key,required this.receipts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return  Dismissible(
    //   key: UniqueKey(),
    //   direction: DismissDirection.endToStart,
    //   onDismissed: (dis){},
    //   background: Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Container(
    //           width: 58,
    //           height: 58,
    //           decoration: BoxDecoration(
    //             color: AppColors.current.success,
    //             borderRadius: BorderRadius.circular(16)
    //           ),
    //           child: SvgPicture.asset(AppAssets.category),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Container(
    //           width: 58,
    //           height: 58,
    //           decoration: BoxDecoration(
    //               color: AppColors.current.secondary,
    //               borderRadius: BorderRadius.circular(16)
    //           ),
    //           child: SvgPicture.asset(AppAssets.category),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Container(
    //           width: 58,
    //           height: 58,
    //           decoration: BoxDecoration(
    //               color: AppColors.current.primaryLight,
    //               borderRadius: BorderRadius.circular(16)
    //           ),
    //           child: SvgPicture.asset(AppAssets.category),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           width: 58,
    //           height: 58,
    //           decoration: BoxDecoration(
    //               color: AppColors.current.accent,
    //               borderRadius: BorderRadius.circular(16)
    //           ),
    //           child: SvgPicture.asset(AppAssets.category),
    //         ),
    //       ),
    //     ],
    //   ),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     decoration: BoxDecoration(
    //       color: AppColors.current.neutral,
    //       borderRadius: BorderRadius.circular(16),
    //       border: Border.all(
    //         width: 2,
    //         color: AppColors.current.primary,
    //       ),
    //     ),
    //     child: Column(
    //       children: [
    //          Obx((){
    //          return  Padding(
    //            padding:  EdgeInsets.symmetric(
    //                horizontal: receipts.isExpanded.value? 8:2
    //            ),
    //            child: Row(
    //              children: [
    //                Container(
    //                  width: 36,
    //                  height: 36,
    //                  alignment: Alignment.center,
    //                  padding: const EdgeInsets.only(top: 6),
    //                  decoration:  const BoxDecoration(
    //                      image:  DecorationImage(
    //                          fit: BoxFit.contain,
    //                          image: AssetImage(AppAssets.item,)
    //                      )
    //                  ),
    //                  child: Text(receipts.numberOfInvoice.toString(),
    //                    style: TextStyle(
    //                      fontWeight: FontWeight.w500,
    //                      fontSize: 10,
    //                      fontFamily: 'Tajawal',
    //                      color: AppColors.current.primary,
    //                    ),
    //                  ),
    //                ),
    //                Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
    //                  child: Column(
    //                    mainAxisAlignment: MainAxisAlignment.start,
    //                    crossAxisAlignment: CrossAxisAlignment.start,
    //                    children: [
    //                      Text(
    //                        receipts.title,
    //                        style:  TextStyle(fontSize: 16,
    //                            fontFamily: 'Tajawal',
    //                            fontWeight: FontWeight.w500,
    //                            color: AppColors.current.text
    //                        ),
    //                      ),
    //                      Text(
    //                        receipts.date,
    //                        style:  TextStyle(fontSize: 12,
    //                            fontFamily: 'Tajawal',
    //                            fontWeight: FontWeight.w500,
    //                            color: AppColors.current.dimmedLight),
    //                      ),
    //                    ],
    //                  ),
    //                ),
    //                const Spacer(flex: 1,),
    //                Column(
    //                  mainAxisAlignment: MainAxisAlignment.start,
    //                  crossAxisAlignment: CrossAxisAlignment.start,
    //                  children: [
    //                    Text(
    //                      receipts.totalPrice.toString(),
    //                      style:  TextStyle(fontSize: 20,
    //                          fontFamily: 'Tajawal',
    //                          fontWeight: FontWeight.w700,
    //                          color: AppColors.current.primary
    //                      ),
    //                    ),
    //                    Row(
    //                      children: [
    //                        Text(
    //                          '800',
    //                          style:  TextStyle(fontSize: 16,
    //                              fontFamily: 'Tajawal',
    //                              fontWeight: FontWeight.w500,
    //                              color: AppColors.current.success),
    //                        ),
    //                        Empty(width: 10,),
    //                        Obx(() {
    //                          return InkWell(
    //                              onTap: (){
    //                                receipts.isExpanded.value = !receipts.isExpanded.value;
    //                              },
    //                              child: Icon(receipts.isExpanded.value? CupertinoIcons.chevron_up:CupertinoIcons.chevron_down, color: AppColors.current.text, size: 24,));
    //                        }),
    //                      ],
    //                    ),
    //                  ],
    //                ),
    //              ],
    //            ),
    //          );
    //        }),
    //          Obx((){
    //          return  Visibility(
    //            visible: receipts.isExpanded.value,
    //            child: Column(
    //              children: [
    //                Padding(
    //                  padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                  child: Divider(
    //                    color: AppColors.current.dimmedLight.withOpacity(0.3),
    //                    height: 1,
    //                    indent: 10,
    //                    thickness: 1,
    //                    endIndent: 10,
    //                  ),
    //                ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Text('الضريبة:  ',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 12,
    //                             fontFamily: 'Tajawal',
    //                             color: AppColors.current.text,
    //                           ),
    //                         ),
    //                         Text(receipts.tax.toString(),
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 12,
    //                             fontFamily: 'Tajawal',
    //                             color: AppColors.current.primary,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text('المبلغ شامل الضريبة:  ',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 12,
    //                             fontFamily: 'Tajawal',
    //                             color: AppColors.current.text,
    //                           ),
    //                         ),
    //                         Text(receipts.totalPrice.toString(),
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 12,
    //                             fontFamily: 'Tajawal',
    //                             color: AppColors.current.primary,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //                Padding(
    //                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
    //                  child: Row(
    //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                    children: [
    //                      Row(
    //                        children: [
    //                          Text('المدفوع:  ',
    //                            style: TextStyle(
    //                              fontWeight: FontWeight.bold,
    //                              fontSize: 12,
    //                              fontFamily: 'Tajawal',
    //                              color: AppColors.current.text,
    //                            ),
    //                          ),
    //                          Text(receipts.paidPrice.toString(),
    //                            style: TextStyle(
    //                              fontWeight: FontWeight.bold,
    //                              fontSize: 12,
    //                              fontFamily: 'Tajawal',
    //                              color: AppColors.current.primary,
    //                            ),
    //                          ),
    //                        ],
    //                      ),
    //                      Row(
    //                        children: [
    //                          Text('المتبقى:  ',
    //                            style: TextStyle(
    //                              fontWeight: FontWeight.bold,
    //                              fontSize: 12,
    //                              fontFamily: 'Tajawal',
    //                              color: AppColors.current.text,
    //                            ),
    //                          ),
    //                          Text(receipts.remainingPrice.toString(),
    //                            style: TextStyle(
    //                              fontWeight: FontWeight.bold,
    //                              fontSize: 12,
    //                              fontFamily: 'Tajawal',
    //                              color: AppColors.current.primary,
    //                            ),
    //                          ),
    //                        ],
    //                      ),
    //                    ],
    //                  ),
    //                )
    //              ],
    //            ),
    //          );
    //        }),
    //       ],
    //     ),
    //   ),
    // );
    return Container(
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
                  horizontal: receipts.isExpanded.value? 8:2
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 6),
                    decoration:  const BoxDecoration(
                        image:  DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(AppAssets.item,)
                        )
                    ),
                    child: Text(receipts.numberSelle!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: 'Tajawal',
                        color: AppColors.current.primary,
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receipts.typeInvoice!,
                          style:  TextStyle(fontSize: 16,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              color: AppColors.current.text
                          ),
                        ),
                        Text(
                          receipts.dateRelease!.toString(),
                          style:  TextStyle(fontSize: 12,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              color: AppColors.current.dimmedLight),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receipts.total!.toString(),
                        style:  TextStyle(fontSize: 20,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w700,
                            color: AppColors.current.primary
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                      receipts.paid!.toString(),
                            style:  TextStyle(fontSize: 16,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w500,
                                color: AppColors.current.success),
                          ),
                          Empty(width: 10,),
                          Obx(() {
                            return InkWell(
                                onTap: (){
                                  receipts.isExpanded.value = !receipts.isExpanded.value;
                                },
                                child: Icon(receipts.isExpanded.value? CupertinoIcons.chevron_up:CupertinoIcons.chevron_down, color: AppColors.current.text, size: 24,));
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          Obx((){
            return  Visibility(
              visible: receipts.isExpanded.value,
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
                            Text('الضريبة:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(receipts.tax!.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('المبلغ شامل الضريبة:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(receipts.total!.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
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
                            Text('المدفوع:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(receipts.paid!.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('المتبقى:  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text,
                              ),
                            ),
                            Text(receipts.rest!.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
