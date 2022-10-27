import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InvoiceItemsController extends GetxController{

  var isVisible = false.obs;

  late DateTime startDateController;
  late DateTime endDateController;
  final dropDownValueInvoiceType = 'فاتورة ضريبة مبسطة'.obs;

  final TextEditingController notes = TextEditingController();


  void setSelectedInvoiceType(value){

    if(dropDownValueInvoiceType.value.contains('فاتورة ضريبة')){
      dropDownValueInvoiceType.value = value;
      isVisible.value = !isVisible.value;
    }

    else {
      if(dropDownValueInvoiceType.value.contains('فاتورة ضريبة مبسطة')){
        dropDownValueInvoiceType.value = value;
        isVisible.value = !isVisible.value;

      }

    }
  }


  var invoices = [
    'فاتورة ضريبة مبسطة',
    'فاتورة ضريبة',
  ].obs;




  @override
  void onClose() {
    super.dispose();
    notes.dispose();
  }

  save() {
    if(notes.value.text.isEmpty){
      OverlayHelper.showErrorToast(AppText.requiredField);
      return;
    }
    // callLoginApi();
    Get.back();
  }

/// get stocks
  final url = 'https://6o9.live/api/GetDataSelle';
  Future<List<Stock>> getStocks(String branchId) async {
    List<Stock> stocks = [];
    final response = await http.post(Uri.parse(url), body: {
      'branch_id': branchId,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['stocks'];
      print(response.body);
      for (var stock in data) {
        stocks.add(Stock.fromJson(stock));
      }

    } else {
      print('Exception');
      return throw Exception();
    }
    return stocks;
  }
  Future<List<Customers>> getCustomerSingle(String branchId) async {
    List<Customers> customersSingle = [];
    final response = await http.post(Uri.parse(url), body: {
      'branch_id': branchId,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['customers'];
      print(response.body);
      for (var customer in data) {
        customersSingle.add(Customers.fromJson(customer));
      }

    } else {
      print('Exception');
      return throw Exception();
    }
    return customersSingle;
  }
  Future<List<Customers>> getCustomerCompany(String branchId) async {
    List<Customers> customersCompany = [];
    final response = await http.post(Uri.parse(url), body: {
      'branch_id': branchId,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['customersComp'];
      print(response.body);
      for (var customer in data) {
        customersCompany.add(Customers.fromJson(customer));
      }

    } else {
      print('Exception');
      return throw Exception();
    }
    return customersCompany;
  }
}

class InvoiceCustomer {
  InvoiceCustomer({
    required this.customers,
    required this.customersComp,
    required this.stocks,
  });

  Customers customers;
  Customers customersComp;
  List<Stock> stocks;

  factory InvoiceCustomer.fromJson(Map<String, dynamic> json) => InvoiceCustomer(
    customers: Customers.fromJson(json["customers"]),
    customersComp: Customers.fromJson(json["customersComp"]),
    stocks: List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customers": customers.toJson(),
    "customersComp": customersComp.toJson(),
    "stocks": List<dynamic>.from(stocks.map((x) => x.toJson())),
  };
}

class Customers {
  Customers({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class Stock {
  Stock({
   required this.id,
    required this.name,
    required this.activityId,
    required this.brancheId,
    required this.status,
  });

  int id;
  String name;
  int activityId;
  int brancheId;
  int status;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    id: json["id"],
    name: json["name"],
    activityId: json["activity_id"],
    brancheId: json["branche_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "activity_id": activityId,
    "branche_id": brancheId,
    "status": status,
  };
}
