import 'dart:async';

import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/items/department/_widgets/department_items.dart';
import 'package:cloud_toq_system/core/page/items/department/department_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../product/product_controller.dart';

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

class DepartmentView extends StatefulWidget {


   DepartmentView({Key? key}) : super(key: key);

  @override
  State<DepartmentView> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  final DepartmentController controller = Get.find();

  final _debouncer = Debouncer(milliseconds: 500);
  List<Category> categories = [];
  List<Category> filteredCategories = [];
  @override
  void initState() {
    super.initState();
    controller.getCategories(sharedPreferences!.getString('Branch_Id')!).then((categoryFromServer) {
      setState(() {
        categories = categoryFromServer;
        filteredCategories = categories;
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
                    //onChanged: (value)=>controller.filterDepartment(value),
                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          filteredCategories = categories
                              .where((u) => (u.name!
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                              .toList();
                        });
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'ابحث عما تريد',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                                color: AppColors.current.dimmedLight.withOpacity(0.2),
                              width: 1
                            ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.current.dimmedLight.withOpacity(0.2),
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(50),
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
                        )),
                  ),
                ),
                 Empty(height: 20,),

                Expanded(
                  child:  ListView.builder(
                    itemCount:filteredCategories.length,
                    itemBuilder: (context, index) =>
                        Column(
                          children: [
                            Divider(height: 1,color: AppColors.current.dimmedLight.withOpacity(0.3),thickness: 1,),
                            DepartmentItem(department:filteredCategories[index]),
                            Divider(height: 1,color: AppColors.current.dimmedLight.withOpacity(0.3),thickness: 1,),
                          ],
                        ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: ()=>Get.toNamed(Routes.DEPARTMENTADD),
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
      title:  Text('الأقسام',
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
