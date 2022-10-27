import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/items/department_add/department_add_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class DepartmentAddView extends StatelessWidget {

  final DepartmentAddController controller = Get.find();
   DepartmentAddView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      resizeToAvoidBottomInset: false,
      drawer: SideMenuView(),
      appBar: _buildToolbar(),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(AppAssets.background_app,fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Empty(
                        height: 30,
                      ),
                      Text('اسم القسم',
                          style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400,
                              fontFamily: 'Tajawal',
                              color: AppColors.current.text)),
                      Empty(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value)=>controller.departmentName.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        decoration: InputDecoration(
                          fillColor: AppColors.current.dimmed.withOpacity(1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.current.dimmed
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.current.dimmed
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),

                        ),
                      ),
                      Empty(
                        height: 20,
                      ),
                      Text('اختر لوناً',
                         style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400,
                              fontFamily: 'Tajawal',
                              color: AppColors.current.text)),
                      Empty(
                        height: 20,
                      ),
                      buildColorPicker(context),

                      Center(
                        child: ElevatedButton(
                            onPressed: ()=>_onSavedDepartment(),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(340,52),
                              shape:  RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text('حفظ',style: TextStyle(
                              fontSize: 16,
                                fontWeight:FontWeight.w700,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.success
                            ),
                            ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  double _borderRadius = 8;
  double _blurRadius = 5;
  double _iconSize = 24;
  Widget pickerItemBuilder(Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: color,
        boxShadow: [BoxShadow(color: color.withOpacity(0.8), offset: const Offset(1, 2), blurRadius: _blurRadius)],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isCurrentColor ? 1 : 0,
            child: Icon(
              Icons.done,
              size: _iconSize,
              color: useWhiteForeground(color) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
  Widget buildColorPicker(BuildContext context) {
    return BlockPicker(
      availableColors: [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.amber,
        Colors.deepPurple,
        Colors.brown
      ],
      pickerColor: Colors.red,
      itemBuilder: pickerItemBuilder,
      onColorChanged: (Color color){ //on color picked
        print(color);
      },
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
      title:  Text('اضافة قسم',
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
  _onSavedDepartment() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.save();
    }
  }
}
