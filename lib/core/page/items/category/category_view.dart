import 'dart:async';

import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/items/category/_widgets/category_items.dart';
import 'package:cloud_toq_system/core/page/items/category/category_controller.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
class CategoryView extends StatefulWidget {


   CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryController controller = Get.find();

  String? idCategory;
  final _debouncer = Debouncer(milliseconds: 500);
  List<ProductElement> products = [];
  List<ProductElement> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    idCategory = sharedPreferences!.getString('product')!;
    print('IDidID${idCategory}');
    controller.getProducts(idCategory!).then((productFromServer) {
      setState(() {
        products = productFromServer;
        filteredProducts = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      drawer: SideMenuView(),
      appBar: _buildToolbar(),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(AppAssets.background_app,fit: BoxFit.fill),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    //onChanged: (value)=>controller.filterCategory(value),
                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          filteredProducts = products
                              .where((u) => (u.name!
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                              u.unityName!.toLowerCase().contains(string.toLowerCase())))
                              .toList();
                        });
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'ابحث عما تريد',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              width: 1,
                                color: AppColors.current.dimmedLight.withOpacity(0.3)
                            )
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.current.dimmedLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Tajawal',
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.current.primary,
                          size: 30,
                        ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.current.dimmedLight.withOpacity(0.2),width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                 Empty(height: 20,),
                 Divider(
                    color: AppColors.current.dimmedLight.withOpacity(0.5),
                    endIndent: 0,
                    indent: 0,
                    thickness: 1,
                    height: 1,

                ),
                Empty(height: 16,),
                // Expanded(
                //   child:Obx((){
                //     return ListView.builder(
                //       itemCount:controller.foundList.value.length,
                //       itemBuilder: (context, index) => Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                //         child: CategoryItem(category:controller.foundList.value[index]),
                //       ),
                //     );
                //   }),
                // ),
                Expanded(
                  child:  ListView.builder(
                    itemCount:filteredProducts.length,
                    itemBuilder: (context, index) =>
                        Column(
                          children: [
                            Divider(height: 1,color: AppColors.current.dimmedLight.withOpacity(0.3),thickness: 1,),
                            CategoryItem(product:filteredProducts[index]),
                            Divider(height: 1,color: AppColors.current.dimmedLight.withOpacity(0.3),thickness: 1,),
                          ],
                        ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: ()=>Get.toNamed(Routes.CATEGORYADD),
                  child: Image.asset(AppAssets.floating,fit: BoxFit.fill,),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildToolbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.current.primary,
      leadingWidth: 40,
      elevation: 0.0,
      titleSpacing: 0,
      foregroundColor: AppColors.current.success,
      title:  Text('كل الأصناف',
        style: TextStyle(
            color: AppColors.current.success,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Tajawal'
        ),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_forward,
            size: 36,
            color: AppColors.current.success,),
          ),
          onTap:()=>Get.back(),
        ),
      ],

    );
  }
}
