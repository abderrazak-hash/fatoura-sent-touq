import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_toq_system/core/page/payment/invoice_webview.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:webcontent_converter/webcontent_converter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sunmi_printer_plus/enums.dart';
import 'dart:convert';
//TODO:

import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
// import 'package:webcontent_converter/webcontent_converter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

final ProductController controller = Get.put(ProductController());

class PaymentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    payValue = (controller.price.value / divider.value).toPrecision(2).obs;
    rest.value = 0;
    values = RxList<double>([controller.price.value]);
  }

  RxList<double> values = RxList<double>([]);

  Rx<int> divider = 1.obs;
  late Rx<double> payValue;
  Rx<double> rest = 0.0.obs;

  void divide() {
    double price = controller.price.value;
    if (divider < price / 2) {
      divider.value = (divider.value + 1);
      payValue.value = (price / divider.value).toPrecision(2);
      values.clear();
      for (int i = 0; i < divider.value; i++) {
        values.add(payValue.value);
      }
      rest.value = 0;
      values.refresh();
      payValue.refresh();
      divider.refresh();
      rest.refresh();
    }
  }

  void undivide() {
    double price = controller.price.value;
    if (divider > 1) {
      divider.value = (divider.value - 1);
      payValue.value = (price / divider.value).toPrecision(2);
      values.clear();
      for (int i = 0; i < divider.value; i++) {
        values.add(payValue.value);
      }
      rest.value = 0;
      rest.refresh();
      values.refresh();
      payValue.refresh();
      divider.refresh();
    }
  }

  void updateValue(int index, double value) {
    values[index] = value;
    double sum = 0;
    for (double val in values) {
      sum += val;
    }
    rest.value = controller.price.value - sum;
    rest.refresh();
    values.refresh();
  }

  // get payment method
  final url = 'https://6o9.live/api/GetPaimentMethod';
  Future<List<PaymentModel>> getPaymentMethod(String branchId) async {
    List<PaymentModel> payments = [];
    final response = await http.post(Uri.parse(url), body: {
      'branch_id': branchId,
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody.toString());
      for (var payment in responseBody) {
        payments.add(PaymentModel.fromJson(payment));
      }
    } else {
      print('Exception');
      return throw Exception();
    }

    return payments;
  }

  // send fatora to server

  void sendMyFatouraToServer(
    BuildContext context,
    // int customer_id,
    // int discount,
    // int price,
    // double priceAferDiscont,
    // double priceNoTaxed,
    // int stock_id,
    // double tax
  ) async {
    int i = 0;
    Map<String, String> prods = {};
    while (i < controller.fatouraProducts.length) {
      prods.addAll(controller.fatouraProducts[i].toJson(i));
      i++;
    }

    double x = controller.price.value;

    final _baseUrl = "https://6o9.live/api/SaveSelle";
    try {
      final response = await http.post(Uri.parse(_baseUrl),
          body: {
            'customer_id': '79',
            'branche_id': sharedPreferences!.getString('Branch_Id')!,
            'worktime_id': sharedPreferences!.getString('WorkTime_Id'),
            'discount': '0.00',
            'price': '${controller.price.value}',
            'priceAferDiscont': '${controller.price.value}',
            'priceNoTaxed': '${controller.price.value}',
            'stock_id': '8',
            'tax': '2.61',
            'type_invoice': 'simple',
            'total': '${controller.price.value}',
            "paiments[0][amount]": '${controller.price.value}',
            "paiments[0][painent_method]": '10'
          }..addAll(prods));
      int? invoice_id;
      try {
        final r = json.decode(response.body);
        invoice_id = r['id'];
      } catch (e) {
        invoice_id = 100;
      }
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return InvoiceWebView(invoiceId: invoice_id!);
          },
        ),
      );

      switch (response.statusCode) {
        case 200:
          Get.snackbar(
            '\u{1F643}',
            '200',
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: AppColors.current.success,
            snackPosition: SnackPosition.BOTTOM,
          );
          break;
        default:
          Get.snackbar(
            '\u{1F643}',
            'من فضلك تأكد من صحة البيانات!' + response.statusCode.toString(),
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: AppColors.current.success,
            snackPosition: SnackPosition.BOTTOM,
          );
          break;
      }
    } on SocketException {
      Get.snackbar(
        '\u{1F643}',
        'لا يتوفر اتصال بالانترنت',
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: AppColors.current.success,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class PaymentModel {
  PaymentModel({
    required this.id,
    required this.companyId,
    required this.typeCompany,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int companyId;
  String typeCompany;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["id"],
        companyId: json["company_id"],
        typeCompany: json["type_company"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "type_company": typeCompany,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
