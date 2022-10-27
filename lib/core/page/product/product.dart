// import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Product {
//   String name;
//   String category;
//   String price;
//   Color color;
//   int count;
//   String image;
//   Product(this.name,this.category, this.price, this.color, this.count, this.image);
// }

// List<Product> productList = [
//   Product('ورق كاشير','كرتونة', "100\$", Colors.red, 0,'assets/images/def.png'),
//   Product('ورق طباعة','حبة', "200\$",Colors.green, 0,'assets/images/def.png'),
//   Product('طابعة', 'كرتونة',"300\$",Colors.blue, 0,'assets/images/def.png'),
//   Product('كاميرا','حبة', "400\$", Colors.yellow, 0,'assets/images/def.png'),
//   Product('جهاز طبى','كرتونة', "500\$",Colors.orange, 0,'assets/images/def.png'),
//   Product('حاسوب','حبة', "600\$", Colors.teal, 0,'assets/images/def.png'),
//   Product('ورق  a4', 'حبة',"400\$", Colors.yellow, 0,'assets/images/def.png'),
//   Product('ورق a3','كرتونة', "500\$",Colors.orange, 0,'assets/images/def.png'),
//   Product("جهاز تصوير",'حبة', "600\$", Colors.teal, 0,'assets/images/def.png'),
// ];

class ProductElement {
  ProductElement({
    required this.id,
    required this.name,
    required this.unityName,
    required this.price,
    required this.priceBuy,
    required this.barCode,
    required this.isExpanded,
  });

  int? id;
  String? name;
  String? unityName;

  String? price;
  String? priceBuy;
  String? barCode;
  double? tax = 15;
  double? discount = 0.0;
  RxBool isExpanded;
  int quantity = 1;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        unityName: json["unity_name"] ?? '',
        price: json["price"] ?? '',
        priceBuy: json["price_buy"] ?? 'null',
        barCode: json["bar_code"] ?? 'null',
        isExpanded: false.obs,
      );
  Map<String, String> toJson(int index) => {
        "products[$index][id]": '$id',
        "products[$index][type_product]": '$name',
        "products[$index][qnt]": '$quantity',
        "products[$index][priceSell]": '$price',
        "products[$index][discount]": '$discount',
        "products[$index][tax]": '$tax',
        // "products[$index][total]": '$priceBuy',
        "products[$index][total]": '$price',
      };
}
