
import 'dart:io';

import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/items/category_add/category_add_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoryAddView extends StatefulWidget {
  CategoryAddView({Key? key}) : super(key: key);

  @override
  State<CategoryAddView> createState() => _CategoryAddViewState();
}

class _CategoryAddViewState extends State<CategoryAddView> {
  final CategoryAddController controller = Get.find();
  final formKey = GlobalKey<FormState>();
  bool isSwitched = false;


  List<Widget> cardList = [
    Container(
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.current.success,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 236,
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "الوحدة",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          color: AppColors.current.text),
                      fillColor: AppColors.current.dimmed.withOpacity(1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.current.dimmed),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Empty(
                width: 8,
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppAssets.remove,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "الكمية",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: AppColors.current.text),
                      fillColor: AppColors.current.dimmed.withOpacity(1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.current.dimmed),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Empty(
                width: 8,
              ),
              SizedBox(
                width: 140,
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "الباركود",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: AppColors.current.text),
                      fillColor: AppColors.current.dimmed.withOpacity(1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.current.dimmed),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "سعر الشراء",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: AppColors.current.text),
                      fillColor: AppColors.current.dimmed.withOpacity(1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.current.dimmed),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Empty(
                width: 8,
              ),
              SizedBox(
                width: 140,
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "سعر البيع",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: AppColors.current.text),
                      fillColor: AppColors.current.dimmed.withOpacity(1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.current.dimmed),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  void _addCardWidget() {
    setState(() {
      cardList.add(buildForm());
    });
  }

  int option_var = 0;
  void _removeCardWidget() {
    setState(() {
      cardList.removeAt(option_var);
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
            Image.asset(AppAssets.background_app, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Empty(
                        height: 24,
                      ),
                      TextFormField(
                        onChanged: (value)=>controller.categoryType.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        decoration: InputDecoration(
                            hintText: 'نوع الصنف',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                            fillColor: AppColors.current.dimmed.withOpacity(1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.current.dimmed),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.current.dimmed),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),

                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                  _buildDepartment(),
                      Empty(
                        height: 24,
                      ),
                      TextFormField(
                        onChanged: (value)=>controller.categoryName.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        decoration: InputDecoration(
                            hintText: 'اسم الصنف',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                            fillColor: AppColors.current.dimmed.withOpacity(1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.current.dimmed),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.current.dimmed),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),

                      TextFormField(
                        onChanged: (value)=>controller.discount.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),

                        decoration: InputDecoration(
                            hintText: 'حد الخصم',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                            fillColor: AppColors.current.dimmed.withOpacity(1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.current.dimmed),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.current.dimmed),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),

                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('خاضع لضريبة',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                          ),
                        Obx((){
                          return  Switch(
                            value: controller.isSwitch.value,
                            onChanged: (value) {
                             controller.setSelectedSwitchTax(value);
                            },
                            inactiveTrackColor: AppColors.current.dimmedLight.withOpacity(0.2),
                            activeTrackColor: AppColors.current.primary.withOpacity(0.3),
                            activeColor: AppColors.current.primary,
                          );
                        }),
                        ],
                      ),
                      Empty(
                        height: 24,
                      ),

                      TextFormField(
                        onChanged: (value)=>controller.request.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        decoration: InputDecoration(
                            hintText: 'حد الطلب',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                            fillColor: AppColors.current.dimmed.withOpacity(1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.current.dimmed),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.current.dimmed),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(color: AppColors.current.primary,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),

                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.current.primary,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cardList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: cardList[index],
                              );
                            }),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(324, 52),
                            primary: AppColors.current.dimmed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: AppColors.current.primary,
                                width: 1
                              )
                            )
                          ),
                          onPressed: () {
                            _addCardWidget();
                          },
                          child: SvgPicture.asset(AppAssets.add,color: AppColors.current.primary,),
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      TextFormField(
                        maxLines: 5,
                        onChanged: (value)=>controller.request.text=value,
                        validator: RequiredValidator(errorText: AppText.requiredField,),
                        decoration: InputDecoration(
                            hintText: 'ملاحظات',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                            fillColor: AppColors.current.dimmed.withOpacity(1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.current.dimmed),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.current.dimmed),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: TextStyle(
                            color: AppColors.current.primary,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                          )
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Divider(
                        height: 1,
                          color: AppColors.current.dimmedLight.withOpacity(0.2),
                        endIndent: 16,
                          indent: 16,
                        thickness: 2,
                      ),
                      Empty(
                        height: 24,
                      ),

                      Empty(
                        height: 20,
                      ),
                      Obx((){
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 1,
                                color: AppColors.current.primary,
                              )
                          ),
                          child: Column(
                            children: [
                              buildColorPicker(context),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 96,
                                    height: 96,
                                    padding: const EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child:controller.selectedImagePath.value!=''?
                                      ClipRRect(
                                        borderRadius:BorderRadius.circular(16),
                                        child: Image.file(File(controller.selectedImagePath.value),
                                          width: 96,height: 96,
                                          fit: BoxFit.cover,
                                        ),
                                      ):ClipRRect(
                                        borderRadius:    BorderRadius.circular(16),
                                        child: Image.asset(AppAssets.def,
                                          width: 96,height: 96,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          controller.getImage(ImageSource.gallery);
                                        } ,
                                        child: SvgPicture.asset(AppAssets.uploading),
                                      ),

                                      InkWell(
                                        onTap:(){
                                          controller.getImage(ImageSource.camera);
                                        } ,
                                        child: Text('أو التقط صورة',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.current.dimmedLight,
                                              fontFamily: 'Tajawal'
                                          ),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Empty(height: 24,),
                            ],
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Center(
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

  double _borderRadius = 20;

  double _blurRadius = 5;

  double _iconSize = 24;

  Widget pickerItemBuilder(
      Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(1, 2),
              blurRadius: _blurRadius)
        ],
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
    return SizedBox(
      height: 96,
      child: Center(
        child: BlockPicker(
          availableColors: const [
            Colors.red,
            Colors.green,
            Colors.amber,
            Colors.deepPurple,
          ],
          pickerColor: Colors.red,
          itemBuilder: pickerItemBuilder,
          onColorChanged: (Color color) {
            //on color picked
            print(color);
          },
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
      title: Text(
        'اضافة قسم',
        style: TextStyle(
            color: AppColors.current.success,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Tajawal'),
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
        ),
      ],
    );
  }

  Widget _buildDepartment(){
    return SizedBox(
        width:MediaQuery.of(context).size.width-10,
        height: 46,
        child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return Obx((){
                return DropdownButtonHideUnderline(
                  child:InputDecorator(
                    decoration:  InputDecoration(
                      errorStyle:  TextStyle(
                          color: AppColors.current.text,
                          fontFamily: 'Tajawal',
                          fontSize: 16.0),
                      fillColor: AppColors.current.dimmed.withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.current.dimmed),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: DropdownButton(
                        hint: Text(controller.dropDownValueDepartment.value,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text)),
                        icon: SvgPicture.asset(
                          AppAssets.drop,
                          fit: BoxFit.fitHeight,
                        ),
                        isExpanded: true,
                        elevation: 10,
                        iconEnabledColor: AppColors.current.primary,
                        items: controller.items.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                  color:
                                  AppColors.current.text),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) => controller.setSelectedDepartment(newValue),
                        value: controller.dropDownValueDepartment.value
                    ),
                  ),
                );
              });
            }),
      );

  }
  Widget buildForm() {
    return Container(
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.current.primary,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _buildOneRow(),
          _buildTwoRow(),
          _buildThreeRow(),
        ],
      ),
    );
  }

  Widget _buildOneRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildUnitTextFormField(),
        Empty(
          width: 16,
        ),
        _buildRemoveUnit(),
      ],
    );
  }

  Widget _buildTwoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuantityTextFormField(),
        Empty(
          width: 16,
        ),
        _buildBarCodeTextFormField()
      ],
    );
  }

  Widget _buildThreeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPriceBuyTextFormField(),
        Empty(
          width: 16,
        ),
        _buildPriceSellTextFormField(),
      ],
    );
  }

  Widget _buildUnitTextFormField() {
    return SizedBox(
      width: 236,
      height: 54,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "الوحدة",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Tajawal',
                fontSize: 14,
                color: AppColors.current.text),
            fillColor: AppColors.current.dimmed.withOpacity(1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.current.dimmed),
              borderRadius: BorderRadius.circular(50),
            ),
          focusedBorder:  OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.current.dimmed),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityTextFormField() {
    return SizedBox(
      width: 140,
      height: 54,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "الكمية",

            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Tajawal',
                fontSize: 14,
                color: AppColors.current.text),
            fillColor: AppColors.current.dimmed.withOpacity(1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.current.dimmed),
              borderRadius: BorderRadius.circular(50),
            ),
          focusedBorder:  OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.current.dimmed),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildBarCodeTextFormField() {
    return SizedBox(
      width: 140,
      height: 54,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "الباركود",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Tajawal',
                color: AppColors.current.text),
            fillColor: AppColors.current.dimmed.withOpacity(1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.current.dimmed),
              borderRadius: BorderRadius.circular(50),
            ),
          focusedBorder:  OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.current.dimmed),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceBuyTextFormField() {
    return SizedBox(
      width: 140,
      height: 54,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "سعر الشراء",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Tajawal',
                color: AppColors.current.text),
            fillColor: AppColors.current.dimmed.withOpacity(1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.current.dimmed),
              borderRadius: BorderRadius.circular(50),
            ),
          focusedBorder:  OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.current.dimmed),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceSellTextFormField() {
    return SizedBox(
      width: 140,
      height: 54,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "سعر البيع",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Tajawal',
                color: AppColors.current.text),
            fillColor: AppColors.current.dimmed.withOpacity(1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.current.dimmed),
              borderRadius: BorderRadius.circular(50),
            ),
          focusedBorder:  OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.current.dimmed),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveUnit() {
    return InkWell(
      onTap: () {
        _removeCardWidget();
      },
      child: SvgPicture.asset(
        AppAssets.remove,
      ),
    );
  }
  _onSavedDepartment() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.save();
    }
  }
}
