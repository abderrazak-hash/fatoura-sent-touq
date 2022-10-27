import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemNameController extends GetxController {
  final url = 'https://6o9.live/api/ListOption';
  Future<List<ItemUnit>> getItemUnit(String id) async {
    List<ItemUnit> items = [];
    final response = await http.post(Uri.parse(url), body: {
      'product_id': id,
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // print(responseBody.toString());
      for (var product in responseBody) {
        items.add(ItemUnit.fromJson(product));
      }
    } else {
      return throw Exception();
    }

    return items;
  }

  final urlStock = 'https://6o9.live/api/GetDataSelle';
  Future<List<Branche>> getTax(String branchId) async {
    List<Branche> branches = [];
    final response = await http.post(Uri.parse(urlStock), body: {
      'branch_id': branchId,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['branche'];
      // print(response.body);
      for (var branch in data) {
        branches.add(Branche.fromJson(branch));
      }
    } else {
      return throw Exception();
    }

    return branches;
  }
}

class ItemUnit {
  ItemUnit({
    required this.id,
    required this.productId,
    required this.unityName,
    required this.quantity,
    required this.price,
    required this.priceBuy,
    required this.isDefault,
    required this.barCode,
  });

  int id;
  int productId;
  String unityName;
  String quantity;
  String price;
  dynamic priceBuy;
  String isDefault;
  dynamic barCode;

  factory ItemUnit.fromJson(Map<String, dynamic> json) => ItemUnit(
        id: json["id"],
        productId: json["product_id"],
        unityName: json["unity_name"],
        quantity: json["quantity"],
        price: json["price"],
        priceBuy: json["price_buy"],
        isDefault: json["is_default"],
        barCode: json["bar_code"],
      );
}

class CustomerStockTax {
  CustomerStockTax({
    required this.customers,
    required this.customersComp,
    required this.stocks,
    required this.branche,
  });

  List<Customer> customers;
  List<Customer> customersComp;
  List<Stock> stocks;
  List<Branche> branche;

  factory CustomerStockTax.fromJson(Map<String, dynamic> json) =>
      CustomerStockTax(
        customers: List<Customer>.from(
            json["customers"].map((x) => Customer.fromJson(x))),
        customersComp: List<Customer>.from(
            json["customersComp"].map((x) => Customer.fromJson(x))),
        stocks: List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x))),
        branche:
            List<Branche>.from(json["branche"].map((x) => Branche.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
        "customersComp":
            List<dynamic>.from(customersComp.map((x) => x.toJson())),
        "stocks": List<dynamic>.from(stocks.map((x) => x.toJson())),
        "branche": List<dynamic>.from(branche.map((x) => x.toJson())),
      };
}

class Branche {
  Branche({
    required this.id,
    required this.name,
    required this.activityId,
    required this.companyId,
    required this.adresse,
    required this.taxNumber,
    required this.taxValue,
    required this.inTax,
    required this.commercialNumber,
    required this.status,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int activityId;
  int companyId;
  dynamic adresse;
  String taxNumber;
  String taxValue;
  int inTax;
  String commercialNumber;
  String status;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory Branche.fromJson(Map<String, dynamic> json) => Branche(
        id: json["id"],
        name: json["name"],
        activityId: json["activity_id"],
        companyId: json["company_id"],
        adresse: json["adresse"],
        taxNumber: json["tax_number"],
        taxValue: json["tax_value"],
        inTax: json["inTax"],
        commercialNumber: json["commercial_number"],
        status: json["status"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "activity_id": activityId,
        "company_id": companyId,
        "adresse": adresse,
        "tax_number": taxNumber,
        "tax_value": taxValue,
        "inTax": inTax,
        "commercial_number": commercialNumber,
        "status": status,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Customer {
  Customer({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int activityId;
  int brancheId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        name: json["name"],
        activityId: json["activity_id"],
        brancheId: json["branche_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "activity_id": activityId,
        "branche_id": brancheId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
