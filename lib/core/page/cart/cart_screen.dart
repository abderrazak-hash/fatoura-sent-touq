import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/cart/cart_controller.dart';
import 'package:cloud_toq_system/core/page/cart/widget/cart_list_view.dart';
import 'package:cloud_toq_system/core/page/invoice_items/invoice_item_view.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());
final CartController controllerCart = Get.put(CartController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.navigateToListItemScreen,
      // onWillPop: () async {
      //   // Get.toNamed(AppPages.routes[8].name);
      //   // return true;
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => InvoiceItemView()));
      //   return true;
      // },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(AppAssets.background_app),
            Column(
              children: [
                _buildToolbar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CartListView(),
                        _buildDivider(),
                        _buildTotal(),
                      ],
                    ),
                  ),
                ),
                _buildPayment(),
                Empty(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildToolbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'الفاتورة الإجمالية',
        style: TextStyle(
            color: AppColors.current.success,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Tajawal'),
      ),
      leading: IconButton(
        onPressed: () {
          controller.removeItems();
        },
        icon: Icon(
          Icons.delete,
          color: AppColors.current.success,
        ),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.arrow_forward,
              size: 36,
              color: AppColors.current.success,
            ),
          ),
          onTap: () => Get.back(),
          // onPressed:()=>Get.offNamed(Routes.HOME),
        ),
      ],
    );
  }

  Widget _buildPayment() {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.PAYMENT);
        },
        child: Container(
          width: 345,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.current.primary,
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'السداد',
                style: TextStyle(
                    color: AppColors.current.success,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    fontFamily: 'Tajawal'),
              ),
              Obx(() => Text(
                    controller.price.value.toString(),
                    style: TextStyle(
                        color: AppColors.current.success,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        fontFamily: 'Tajawal'),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.current.dimmedLight,
      indent: 20,
      thickness: 0.5,
      endIndent: 20,
    );
  }

  Widget _buildTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        children: [
          Text(
            'الإجمالي',
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 16,
              color: AppColors.current.text,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Obx(
            () => Text(
              controller.price.value.toString(),
              style: TextStyle(
                  color: AppColors.current.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: 'Tajawal'),
            ),
          ),
        ],
      ),
    );
  }
}
