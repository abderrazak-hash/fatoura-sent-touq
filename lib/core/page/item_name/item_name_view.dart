import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/item_name/item_name_controller.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());
final ItemNameController controllerItemName = Get.put(ItemNameController());

class ItemNameView extends StatefulWidget {
  int? index;
  ProductElement? product;
  ItemNameView({
    Key? key,
    this.product,
    this.index,
  }) : super(key: key);

  @override
  State<ItemNameView> createState() => _ItemNameViewState();
}

class _ItemNameViewState extends State<ItemNameView> {
  TextEditingController discountEditingController = TextEditingController();
  double discount = 0.0;
  late Future<List<ItemUnit>> _future;
  late Future<List<Branche>> _futureTax;
  ItemUnit? mySelection;
  ProductElement? product;
  late TextEditingController txtCtrl;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    _future = controllerItemName.getItemUnit(product!.id.toString());
    _futureTax =
        controllerItemName.getTax(sharedPreferences!.getString('Branch_Id')!);
    txtCtrl = TextEditingController(text: product!.discount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildToolbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Image.asset(AppAssets.background_app),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Empty(
                  height: 12,
                ),
                _buildItemDetails(),
                Empty(
                  height: 12,
                ),
                _buildText(text: "الوحدة"),
                _buildPaymentType(
                  context,
                ),
                Empty(
                  height: 12,
                ),
                _buildText(text: "الكمية"),
                _buildAddRemoveItem(),
                _buildDivider(),
                _buildPaidAndNotPaid(),
                _buildDivider(),
                const Spacer(
                  flex: 1,
                ),
                _buildDivider(),
                _buildOkButton(),
              ],
            ),
          ],
        ),
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
      title: Text(
        'اسم المنتج',
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

  Widget _buildItemDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.item),
          Empty(
            width: 24,
          ),
          Column(
            children: [
              Text(
                product!.name!,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  color: AppColors.current.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Empty(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    product!.quantity.toString(),
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 10,
                      color: AppColors.current.dimmedLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Empty(
                    width: 4,
                  ),
                  Text(
                    controller.unitName.value,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 12,
                      color: AppColors.current.dimmedLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            product!.price!,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20,
              color: AppColors.current.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 16, right: 16),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Tajawal',
            fontSize: 16,
            color: AppColors.current.text),
      ),
    );
  }

  Widget _buildPaymentType(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16, top: 0, bottom: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 46,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: AppColors.current.error, blurRadius: 10)
        ]),
        child: FutureBuilder<List<ItemUnit>>(
          future: _future,
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
                          fillColor: AppColors.current.dimmed.withOpacity(0.8),
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
                        child: DropdownButton<ItemUnit>(
                          //hint: Text(snapshot.data!.first.name!,
                          hint: Text(
                            controller.unitName.value,
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
                                    e.unityName,
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
                              controller.unitName.value =
                                  mySelection!.unityName;
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
    );
  }

  Widget _buildAddRemoveItem() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 36, left: 36, bottom: 16),
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
                  try {
                    setState(() {
                      controller.addToFatoura(product!);
                      // count = count! + 1;
                    });
                  } catch (e) {}
                },
                icon: AppAssets.dwon,
              ),
              VerticalDivider(
                width: 1,
                color: AppColors.current.dimmedLight.withOpacity(0.3),
                endIndent: 8,
                indent: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  product!.quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                    fontSize: 24,
                  ),
                ),
              ),
              VerticalDivider(
                width: 1,
                color: AppColors.current.dimmedLight.withOpacity(0.3),
                endIndent: 8,
                indent: 8,
              ),
              _buildAddRemoveButton(
                onTap: () {
                  try {
                    setState(() {
                      controller.removeFromFatoura(product!);
                      // count = count! - 1;
                    });
                  } catch (e) {}
                },
                icon: AppAssets.up,
              ),
            ],
          ),
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
        width: 28,
        height: 28,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 0.5,
      color: AppColors.current.dimmedLight.withOpacity(0.3),
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildPaidAndNotPaid() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 4.0, bottom: 4),
            child: Row(
              children: [
                Text(
                  'الخصم',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: AppColors.current.text),
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 96,
                  height: 48,
                  child: TextField(
                    controller: txtCtrl,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.1),
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
                          color: AppColors.current.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: 'Tajawal'),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        try {
                          discount =
                              double.parse(value.replaceAll("\$", "").trim());
                        } catch (e) {
                          discount = 0.0;
                        }
                        controller.discountProduct(widget.index!, discount);
                      });
                    },
                    onTap: () {
                      txtCtrl.clear();
                      discount = 0;
                      controller.discountProduct(widget.index!, discount);
                    },
                  ),
                ),
              ],
            ),
          ),
          _buildTaxi(paid: 'الضريبة', price: 0.0),
          _buildTotalPrice(
              paid: 'الإجمالى',
              price:
                  (double.parse(product!.price!.replaceAll("\$", "").trim()) *
                          product!.quantity) +
                      product!.tax! /
                          100 *
                          double.parse(
                              product!.price!.replaceAll("\$", "").trim()) *
                          product!.quantity -
                      (product!.discount! * product!.quantity)),
        ],
      ),
    );
  }

  Widget _buildTotalPrice({required String paid, required double price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paid,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
                fontSize: 16,
                color: AppColors.current.text),
          ),
          Text(
            // '${double.parse(product!.price!.replaceAll("\$", "").trim()) * product!.quantity + taxValue / 100 * double.parse(product!.price!.replaceAll("\$", "").trim()) * product!.quantity}',
            '$price',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Tajawal',
                fontSize: 16,
                color: AppColors.current.primary),
          ),
        ],
      ),
    );
  }

  double taxValue = 0.0;

  Widget _buildTaxi({required String paid, required double price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paid,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
                fontSize: 16,
                color: AppColors.current.text),
          ),
          FutureBuilder<List<Branche>>(
              future: _futureTax,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center();

                  case ConnectionState.active:
                    return const Center();

                  case ConnectionState.none:
                    // handel connection error
                    return const Center();

                  case ConnectionState.done:
                    if (snapshot.error != null) {
                      // handel error
                      // return  Text(snapshot.error.toString());
                      return Center(
                        child: Text(
                          '',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Tajawal',
                              color: AppColors.current.text),
                        ),
                      );
                    } else {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            'لا توجد ضريبة',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: AppColors.current.text),
                          ),
                        );
                      } else {
                        try {
                          taxValue =
                              double.parse(snapshot.data!.first.taxValue);
                        } catch (e) {
                          taxValue = 0.0;
                        }
                        return Text(
                          taxValue.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Tajawal',
                              color: AppColors.current.text),
                        );
                      }
                    }
                }
              }),
        ],
      ),
    );
  }

  Widget _buildOkButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32),
      child: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(340, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'تأكيد',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: 'Tajawal',
                color: AppColors.current.success),
          ),
        ),
      ),
    );
  }
}
