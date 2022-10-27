import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/invoice_items/invoice_items_controller.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final InvoiceItemsController controller = Get.put(InvoiceItemsController());

class InvoiceItemView extends StatefulWidget {
  @override
  State<InvoiceItemView> createState() => _InvoiceItemViewState();
}

class _InvoiceItemViewState extends State<InvoiceItemView> {
  // final InvoiceItemsController controller = Get.find();

  final formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final format = DateFormat("yyyy-MM-dd HH:mm");

  final nameController1 = TextEditingController();

  final phoneController2 = TextEditingController();

  final emailController3 = TextEditingController();

  final notesController4 = TextEditingController();

  late DateTime startDateController12;

  // Initial Selected Value
  String? dropdownvalueInvoiceType;

  String? dropdownvalueCustomerName;

  String? dropdownvalueCustomerStore;

  // List of items in our dropdown menu
  var itemsInvoiceType = [
    'فاتورة ضريبة',
    'فاتورة مبسطة',
  ];

  var itemsCustomerName = [
    'على المطيرى',
    'خالد المسيرى',
    'محمد السمرى',
    'عمر عبدالله',
  ];

  var itemsCustomerStore = [
    'مخزن الاصدقاء',
    'مخرن الاصلاح',
    'مخرن الفاروق',
    'مخزن الصديق',
  ];

  late Future<List<Stock>> _futureStock;
  late Future<List<Customers>> _futureCustomer;
  Customers? mySelectionCustomers;
  Stock? mySelectionStock;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureStock =
        controller.getStocks(sharedPreferences!.getString('Branch_Id')!);
    if (controller.dropDownValueInvoiceType.value
        .contains('فاتورة ضريبة مبسطة')) {
      _futureCustomer = controller
          .getCustomerSingle(sharedPreferences!.getString('Branch_Id')!);
    }

    // else {
    //   if(controller.dropDownValueInvoiceType.value.contains('فاتورة ضريبة')){
    //     _futureCustomer = controller.getCustomerCompany(sharedPreferences!.getString('Branch_Id')!);
    //
    //   }
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildToolbar(),
      body: Stack(
        children: [
          Image.asset(AppAssets.background_app),
          ListView(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Empty(
                        height: 24,
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.isVisible.value,
                          child: DateTimeField(
                            validator: (value) {
                              if (value == null) {
                                return AppText.requiredField;
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: AppColors.current.primaryLight,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                            ),
                            decoration: InputDecoration(
                              suffixIcon: SvgPicture.asset(
                                AppAssets.calendar,
                                width: 24,
                                height: 24,
                                fit: BoxFit.scaleDown,
                              ),
                              fillColor: AppColors.current.dimmedLight
                                  .withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              labelText: AppText.started_date,
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Tajawal",
                                  color: AppColors.current.dimmedLight),
                              errorStyle: TextStyle(
                                fontSize: 14,
                                color: AppColors.current.primary,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            format: format,
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                            onChanged: (v) {
                              controller.startDateController = v!;
                            },
                          ),
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      DateTimeField(
                        validator: (value) {
                          if (value == null) {
                            return AppText.requiredField;
                          }
                          return null;
                        },
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Tajawal",
                            color: AppColors.current.dimmedLight),
                        decoration: InputDecoration(
                          suffixIcon: SvgPicture.asset(
                            AppAssets.calendar,
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                          fillColor:
                              AppColors.current.dimmedLight.withOpacity(0.1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          labelText: AppText.ended_date,
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Tajawal",
                              color: AppColors.current.dimmedLight),
                          errorStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.current.primary,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                        onChanged: (v) {
                          controller.endDateController = v!;
                        },
                      ),
                      Empty(
                        height: 24,
                      ),
                      SizedBox(
                        height: 52,
                        child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                          return Obx(() {
                            return DropdownButtonHideUnderline(
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: AppColors.current.text,
                                      fontFamily: 'Tajawal',
                                      fontSize: 16.0),
                                  fillColor: AppColors.current.neutral
                                      .withOpacity(0.6),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.current.dimmed),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.current.dimmed),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: DropdownButton(
                                  hint: Text('نوع الفاتورة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Tajawal",
                                          color:
                                              AppColors.current.dimmedLight)),
                                  iconSize: 36,
                                  isExpanded: true,
                                  elevation: 10,
                                  iconEnabledColor: AppColors.current.primary,
                                  items: controller.invoices.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.w400,
                                              color: AppColors
                                                  .current.dimmedLight)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      controller.setSelectedInvoiceType(newVal);
                                      if (controller
                                          .dropDownValueInvoiceType.value
                                          .contains('فاتورة ضريبة مبسطة')) {
                                        _futureCustomer =
                                            controller.getCustomerSingle(
                                                sharedPreferences!
                                                    .getString('Branch_Id')!);
                                      } else {
                                        _futureCustomer =
                                            controller.getCustomerCompany(
                                                sharedPreferences!
                                                    .getString('Branch_Id')!);
                                      }
                                      mySelectionCustomers = null;
                                      // mySelectionCustomers =
                                      //     _futureCustomer.obs;
                                      // if(controller.dropDownValueInvoiceType.value.contains('فاتورة ضريبة')){
                                      //   _futureCustomer = controller.getCustomerCompany(sharedPreferences!.getString('Branch_Id')!);
                                      //
                                      // }
                                      //
                                      // else {
                                      //   if(controller.dropDownValueInvoiceType.value.contains('فاتورة ضريبة مبسطة')){
                                      //     _futureCustomer = controller.getCustomerSingle(sharedPreferences!.getString('Branch_Id')!);
                                      //
                                      //   }
                                      //
                                      // }
                                    });
                                  },
                                  value:
                                      controller.dropDownValueInvoiceType.value,
                                ),
                              ),
                            );
                          });
                        }),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 1.35,
                            height: 52,
                            child: FutureBuilder<List<Customers>>(
                              future: _futureCustomer,
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return const Center();

                                  case ConnectionState.active:
                                    return const Center();

                                  case ConnectionState.none:
                                    return const Text(' error ');

                                  case ConnectionState.done:
                                    if (snapshot.error != null) {
                                      return const Text('snapshot.error');
                                    } else {
                                      if (snapshot.hasData) {
                                        // mySelectionCustomers =
                                        //     snapshot.data!.first;
                                        return DropdownButtonHideUnderline(
                                          child: InputDecorator(
                                            decoration: InputDecoration(
                                              errorStyle: TextStyle(
                                                  color: AppColors.current.text,
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 16.0),
                                              fillColor: AppColors
                                                  .current.dimmed
                                                  .withOpacity(0.8),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                            ),
                                            child: DropdownButton<Customers>(
                                              hint: Text(
                                                snapshot.data!.first.name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Tajawal',
                                                    color:
                                                        AppColors.current.text),
                                              ),

                                              icon: SvgPicture.asset(
                                                AppAssets.drop,
                                                fit: BoxFit.fitHeight,
                                              ),
                                              isExpanded: true,
                                              elevation: 10,
                                              iconEnabledColor:
                                                  AppColors.current.primary,
                                              items: [
                                                ...snapshot.data!.map((e) =>
                                                    DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        e.name,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: AppColors
                                                                .current.text),
                                                      ),
                                                    )),
                                              ],
                                              onChanged: (newValue) {
                                                setState(() {
                                                  mySelectionCustomers =
                                                      newValue;
                                                });
                                              },
                                              // value: snapshot.data!.first,
                                              value: mySelectionCustomers ??
                                                  snapshot.data!.first,
                                            ),
                                          ),
                                        );
                                      } else {
                                        // handel empty data
                                        return Center(
                                          child: Text(
                                            'no data found',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                                color: AppColors.current.text),
                                          ),
                                        );
                                      }
                                    }
                                }
                              },
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ADDCUSTOMER);
                              },
                              child: SvgPicture.asset(AppAssets.addCustomer,
                                  fit: BoxFit.cover)),
                        ],
                      ),
                      Empty(
                        height: 24,
                      ),
                      SizedBox(
                        height: 52,
                        child: FutureBuilder<List<Stock>>(
                          future: _futureStock,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center();

                              case ConnectionState.active:
                                return const Center();

                              case ConnectionState.none:
                                // handel connection error
                                return const Text(' error ');

                              case ConnectionState.done:
                                if (snapshot.error != null) {
                                  // handel error
                                  return const Text('snapshot.error');
                                } else {
                                  if (snapshot.hasData) {
                                    return DropdownButtonHideUnderline(
                                      child: InputDecorator(
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                              color: AppColors.current.text,
                                              fontFamily: 'Tajawal',
                                              fontSize: 16.0),
                                          fillColor: AppColors.current.dimmed
                                              .withOpacity(0.8),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0),
                                          ),
                                        ),
                                        child: DropdownButton<Stock>(
                                          //hint: Text(snapshot.data!.first.name!,
                                          hint: Text(
                                            'المخزن',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                                color: AppColors.current.text),
                                          ),
                                          icon: SvgPicture.asset(
                                            AppAssets.drop,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          isExpanded: true,
                                          elevation: 10,
                                          iconEnabledColor:
                                              AppColors.current.primary,
                                          items: [
                                            ...snapshot.data!
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        e.name,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Tajawal',
                                                            color: AppColors
                                                                .current.text),
                                                      ),
                                                    )),
                                          ],

                                          onChanged: (newValue) {
                                            setState(() {
                                              mySelectionStock = newValue;
                                            });
                                          },
                                          value: mySelectionStock,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text(
                                        'لا يوجد مخازن',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Tajawal',
                                            color: AppColors.current.text),
                                      ),
                                    );
                                  }
                                }
                            }
                          },
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          "ملاحظات",
                          style: TextStyle(
                              color: AppColors.current.text,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Tajawal',
                              fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          onChanged: (value) => controller.notes.text = value,
                          validator: RequiredValidator(
                            errorText: AppText.requiredField,
                          ),
                          decoration: InputDecoration(
                              fillColor:
                                  AppColors.current.neutral.withOpacity(0.6),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              errorStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  fontSize: 14,
                                  color: AppColors.current.primary)),
                          maxLines: 5,
                        ),
                      ),
                      Empty(
                        height: 24,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => _onSavedDepartment(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(340, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'تأكيد',
                            style: TextStyle(
                                color: AppColors.current.success,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                      Empty(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onSavedDepartment() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      controller.save();
    }
  }

  AppBar _buildToolbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'عناصر الفاتورة',
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
          // onPressed:()=>Get.offNamed(Routes.HOME),
        ),
      ],
    );
  }
}

class User {
  late String name;

  User({required this.name});
}
