import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/payment/payment_controller.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());
final PaymentController paymentController = Get.put(PaymentController());

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  // TextEditingController textEditingController = TextEditingController();
  // var velocityEditingController = TextEditingController();
  // var finalValue = TextEditingController();

  // double? airFlow = controller.price.value;
  // int? velocity = 0;
  // int? valueFinal = 0;
  // String? sam = "", sam2 = "";
  // String? airFlowText = controller.price.value.toString(),
  //     velocityText = "",
  //     finalText = "";

  @override
  void initState() {
    super.initState();
    // textEditingController.text = controller.price.value.toString();
    // finalValue.addListener(() => setState(() {}));
    // setState(() {
    // (controller.price.value / divider.value).toPrecision(2).obs; = (controller.price.toInt() / divider).toPrecision(2);
    // });
  }

  // String totalCalculated() {
  //   airFlowText = textEditingController.text;
  //   velocityText = velocityEditingController.text;
  //   finalText = finalValue.text;

  //   if (airFlowText != '' && velocityText != '') {
  //     sam = (airFlow! + velocity!).toString();
  //     finalValue.value = finalValue.value.copyWith(
  //       text: sam.toString(),
  //     );
  //   } else if (finalText != '' && velocityText != '') {
  //     sam = (valueFinal! - velocity!).toString();
  //     textEditingController.value = textEditingController.value.copyWith(
  //       text: sam.toString(),
  //     );
  //   } else if (finalText != '' && airFlowText != '') {
  //     sam = (valueFinal! - airFlow!).toString();
  //     velocityEditingController.value =
  //         velocityEditingController.value.copyWith(
  //       text: sam.toString(),
  //     );
  //   }
  //   return sam!;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.background_app),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextField(
          //      //  key: Key(totalCalculated()),
          //       controller: textEditingController,
          //       onChanged: (textEditingController) {
          //         setState(() {
          //           airFlow = int.parse(textEditingController.toString());
          //         });
          //       },
          //       onTap: () {
          //         setState(() {
          //           textEditingController.clear();
          //         });
          //       },
          //       decoration: InputDecoration(
          //         hintText: 'Enter Value',
          //         labelText: 'Air Flow',
          //       ),
          //       keyboardType: TextInputType.number,
          //     ),
          //     TextField(
          //      // key: Key(totalCalculated()),
          //       controller: velocityEditingController,
          //       onChanged: (velocityEditingController) {
          //         setState(() {
          //           velocity = int.parse(velocityEditingController.toString());
          //         });
          //       },
          //       decoration: InputDecoration(
          //         hintText: 'Enter Value',
          //         labelText: 'Velocity',
          //       ),
          //       keyboardType: TextInputType.number,
          //     ),
          //     TextField(
          //        key: Key(totalCalculated()),
          //       controller: finalValue,
          //       onChanged: (value) {
          //         setState(() {
          //           finalValue.value = finalValue.value.copyWith(
          //             text: value.toString(),
          //           );
          //         });
          //       },
          //       onTap: () {
          //         setState(() {
          //           finalValue.clear();
          //           finalValue.value = finalValue.value.copyWith(
          //             text: '',
          //           );
          //         });
          //       },
          //       decoration: InputDecoration(
          //         hintText: 'Enter Value',
          //         labelText: 'Final Value',
          //       ),
          //       keyboardType: TextInputType.number,
          //     ),
          //     Text('Entered Value is  $airFlow + $velocity + ${finalValue.text}'),
          //   ],
          // )
          SingleChildScrollView(
            child: Column(
              children: [
                _buildToolbar(),
                _buildAddRemoveItem(),
                _buildText(),
                _buildDivider(),
                Empty(
                  height: 12,
                ),
                // _buildPaymentType(
                //   context,
                // ),
                _buildPaymentTypeList(),
                Empty(
                  height: 12,
                ),
                _buildDivider(),
                _buildPaidAndNotPaid(),
                _buildDivider(),
                _buildSaveAndPrint(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildToolbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.current.primary,
      automaticallyImplyLeading: false,
      leadingWidth: 40,
      elevation: 0.0,
      titleSpacing: 0,
      foregroundColor: AppColors.current.success,
      title: Obx(
        () => Text(
          controller.price.value.toString(),
          style: TextStyle(
              color: AppColors.current.success,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: 'Tajawal'),
        ),
      ),
      actions: [
        GestureDetector(
          child: Icon(
            Icons.arrow_forward,
            size: 30,
            color: AppColors.current.success,
          ),
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  Widget _buildAddRemoveItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 36, left: 36, bottom: 16, top: 36),
      child: Container(
        width: 245,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: AppColors.current.dimmedLight.withOpacity(0.3),
                width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAddRemoveButton(
                onTap: () {
                  paymentController.divide(/*controller.price.value*/);
                  // _addCardWidget(context);
                },
                icon: AppAssets.dwon),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Obx(
                () => Text(
                  '${paymentController.divider.value}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      fontSize: 24),
                ),
              ),
            ),
            _buildAddRemoveButton(
              onTap: () {
                // _removeCardWidget(context);
                paymentController.undivide(/*controller.price.value*/);
              },
              icon: AppAssets.up,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddRemoveButton(
      {required String icon, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        'مدفوعات',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Tajawal',
            fontSize: 16,
            color: AppColors.current.text),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: AppColors.current.dimmedLight.withOpacity(0.3),
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildPaymentTypeList() {
    return SizedBox(
        height: 250,
        child: Obx(() => ListView.builder(
            itemCount: paymentController.divider.toInt(),
            itemBuilder: ((context, index) => PaymentValueType(
                      index: index,
                      value: paymentController.values[index],
                      /* (controller.price.value /
                              paymentController.divider.value)
                          .toDouble()
                          .toPrecision(2),*/
                    )
                // _buildPaymentType(context)),

                ))));
  }

  Widget _buildPaidAndNotPaid() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المدفوع',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: AppColors.current.text),
                ),
                Obx(
                  () => Text(
                    // price.toString(),
                    (controller.price.toDouble() -
                            paymentController.rest.toDouble())
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        color: AppColors.current.primary),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المتبقي',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: AppColors.current.text),
                ),
                Obx(
                  () => Text(
                    // price.toString(),
                    paymentController.rest.toDouble().toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        color: AppColors.current.primary),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildItemPaidAndNotPaid(
  //     {required String paid, required double price}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           paid,
  //           style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontFamily: 'Tajawal',
  //               fontSize: 16,
  //               color: AppColors.current.text),
  //         ),
  //         Obx(
  //           () => Text(
  //             // price.toString(),
  //             paymentController.rest.toDouble().toString(),
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 fontFamily: 'Tajawal',
  //                 fontSize: 16,
  //                 color: AppColors.current.primary),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSaveAndPrint() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // controller.removeItems();
            //  Get.back();
            paymentController.sendMyFatouraToServer(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(340, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'حفظ وطباعة',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Tajawal',
                color: AppColors.current.success),
          ),
        ),
      ),
    );
  }
}

class PaymentValueType extends StatefulWidget {
  final double value;
  final int index;
  const PaymentValueType({Key? key, required this.index, required this.value})
      : super(key: key);

  @override
  State<PaymentValueType> createState() => _PaymentValueTypeState();
}

class _PaymentValueTypeState extends State<PaymentValueType> {
  late Future<List<PaymentModel>> _future;
  PaymentModel? mySelection;

  var dropdownValueCategory = 'نقدى';

  // List of items in our dropdown menu
  var itemsList = [
    'نقدى',
    'شبكة',
    'بنكى',
  ];

  void selectedPayment(value) {
    dropdownValueCategory = value;
  }

  TextEditingController textEditingController = TextEditingController();
  double val = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      textEditingController.text = widget.value.toString();
    });
    _future = paymentController
        .getPaymentMethod(sharedPreferences!.getString('Branch_Id')!);
  }

  @override
  void didUpdateWidget(covariant PaymentValueType oldWidget) {
    if (widget.value != oldWidget.value) {
      setState(() {
        textEditingController.text = widget.value.toString();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPaymentType(context);
  }

  Widget _buildPaymentType(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.6,
            height: 46,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: AppColors.current.error, blurRadius: 10)
            ]),
            child: FutureBuilder<List<PaymentModel>>(
              future: _future,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center();

                  case ConnectionState.active:
                    return const Center();

                  case ConnectionState.none:
                    // handel connection error
                    return Text(' error ');

                  case ConnectionState.done:
                    if (snapshot.error != null) {
                      // handel error
                      return Text('snapshot.error');
                    } else {
                      if (snapshot.hasData) {
                        return DropdownButtonHideUnderline(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: AppColors.current.text,
                                  fontFamily: 'Tajawal',
                                  fontSize: 16.0),
                              fillColor:
                                  AppColors.current.dimmed.withOpacity(0.8),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                            ),
                            child: DropdownButton<PaymentModel>(
                              //hint: Text(snapshot.data!.first.name!,
                              hint: Text(
                                snapshot.data!.first.name,
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
                              iconEnabledColor: AppColors.current.primary,
                              items: [
                                ...snapshot.data!.map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Tajawal',
                                            color: AppColors.current.text),
                                      ),
                                    )),
                              ],

                              onChanged: (newValue) {
                                setState(() {
                                  mySelection = newValue;
                                });
                              },
                              value: mySelection,
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
          Empty(
            width: 10,
          ),
          _buildValuePayment(),
        ],
      ),
    );
  }

  Widget _buildValuePayment() {
    return Container(
      width: 80,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: AppColors.current.error, blurRadius: 10)],
        borderRadius: BorderRadius.circular(50),
        color: AppColors.current.dimmed,
      ),
      // child: Text('${widget.value}'),
      child: TextField(
        // key: Key(totalCalculated()),
        controller: textEditingController,
        onChanged: (value) {
          setState(() {
            String x = val.toString();
            if (double.parse(value) <= widget.value) {
              try {
                val = double.parse(value);
                paymentController.updateValue(widget.index, val);
              } catch (e) {
                val = double.parse(x);
              }
            } else {
              // textEditingController.text = val.toInt().toString();
              textEditingController.clear();
              textEditingController.value =
                  TextEditingValue(text: widget.value.toString());
            }
          });
        },
        onTap: () {
          setState(() {
            textEditingController.clear();
            val = 0;
            paymentController.updateValue(widget.index, val);
          });
        },
        onEditingComplete: () {
          setState(() {
            textEditingController.value = TextEditingValue(
                text: double.parse(textEditingController.value.text)
                    .toPrecision(2)
                    .toString());
          });
        },
        onSubmitted: (value) {
          setState(() {
            textEditingController.value =
                TextEditingValue(text: value.toString());
          });
        },
        decoration: const InputDecoration(),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
