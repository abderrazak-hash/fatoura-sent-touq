import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/item_name/item_name_view.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listViewBody(ProductElement item, int index) {
      return Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemNameView(
                        index: index,
                        product: item,
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.current.neutral,
                    borderRadius: BorderRadius.circular(18),
                    border:
                        Border.all(color: AppColors.current.primary, width: 1)),
                height: 124,
                child: Row(
                  children: [
                  //  Image.asset(AppAssets.item),
                  //   Empty(
                  //     width: 12,
                  //   ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.fatouraProducts[index].name!,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 13,
                              color: AppColors.current.text,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Empty(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Obx(() => Text(
                                    controller.fatouraProducts[index].quantity
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12,
                                      color: AppColors.current.dimmedLight,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: AppColors.current.primary,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.unitName.value,
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 12,
                                    color: AppColors.current.dimmedLight,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Obx(() =>*/ Text(
                          (((double.parse(item.price!
                                              .replaceAll("\$", "")
                                              .trim()) *
                                          item.quantity) +
                                      item.tax! /
                                          100 *
                                          double.parse(item.price!
                                              .replaceAll("\$", "")
                                              .trim()) *
                                          item.quantity) -
                                  item.discount! * item.quantity)
                              .toString(),
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13,
                            color: AppColors.current.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ), //),
                        Empty(height: 12),
                        Text(
                          '${item.price.toString()}/ ${item.unityName.toString()}',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 13,
                            color: AppColors.current.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.addToFatoura(
                                  controller.fatouraProducts[index]);
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColors.current.primary,
                            )),
                        IconButton(
                          onPressed: () {
                            controller.removeFromFatoura(
                                controller.fatouraProducts[index]);
                          },
                          icon: Icon(
                            Icons.remove,
                            color: AppColors.current.primary,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    }

    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          itemCount: controller.fatouraProducts.length,
          itemBuilder: (_, index) {
            ProductElement item = controller.fatouraProducts[index];
            if (controller.isItemListScreen) {
              return listViewBody(item, index);
            } else if (controller.isCartScreen && item.quantity > 0) {
              return listViewBody(item, index);
            } else {
              return Container();
            }
          },
        ));
  }
}
