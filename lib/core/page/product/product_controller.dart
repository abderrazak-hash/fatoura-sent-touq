import 'dart:convert';
import 'package:cloud_toq_system/core/page/cart/cart_screen.dart';
import 'package:cloud_toq_system/core/page/item_name/item_name_controller.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final ItemNameController controllerItemName = Get.put(ItemNameController());

class ProductController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var products = RxList<ProductElement>([]);

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController()
      ..addListener(() {
        filterItem(searchController.text);
      });
  }

  final url = 'https://6o9.live/api/Category';
  Future<List<Category>> getCategories(String id) async {
    List<Category> categories = [];
    final response = await http.post(Uri.parse(url), body: {
      'branch_id': id,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['Categories'];

      print(response.body);
      for (var category in data) {
        categories.add(Category.fromJson(category));
      }
      sharedPreferences!.setString('idBranch', id);
      print('iddddddddddddddddddddddddd $id');
    } else {
      print('Exception');
      return throw Exception();
    }
    return categories;
  }

  final urlProduct = 'https://6o9.live/api/Product';
  Future<List<ProductElement>> getProducts(String id) async {
    List<ProductElement> productsApi = [];
    final response = await http.post(Uri.parse(urlProduct), body: {
      'category_id': id,
    });
    sharedPreferences!.setString('product', id);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['Products'];
      for (var product in data) {
        productsApi.add(ProductElement.fromJson(product));
      }
      products.value = productsApi;
    } else {
      return throw Exception();
    }

    return products;
  }

  void filterItem(String itemName) {
    List<ProductElement> results = [];
    if (itemName.isEmpty) {
      results = products;
    } else {
      results = products
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(itemName.toLowerCase()))
          .toList();
    }
    products.value = results;
  }

  bool isItemListScreen = true;
  bool isCartScreen = false;
  Rx<int> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;
  Rx<String> unitName = ''.obs;
  //! ------ Fatoura

  RxList<ProductElement> fatouraProducts = RxList<ProductElement>([]);

  void addToFatoura(ProductElement prod) {
    bool exist = false;
    int i = 0;
    for (var prdct in fatouraProducts) {
      if (prdct.id == prod.id) {
        exist = true;
        i = fatouraProducts.indexOf(prdct);
      }
    }
    if (exist) {
      fatouraProducts[i].quantity++;
    } else {
      prod.quantity = 1;
      fatouraProducts.add(prod);
    }
    fatouraProducts.refresh();
    calculateTotalPrices();
    countAllItems();
    getUnitName();
  }

  void removeFromFatoura(ProductElement prod) {
    // final prod = products[index];
    bool exist = false;
    for (var prdct in fatouraProducts) {
      if (prdct.id == prod.id) {
        exist = true;
      }
    }
    // if (fatouraProducts.contains(prod)) {
    if (exist) {
      int i = fatouraProducts.indexOf(prod);
      if (fatouraProducts[i].quantity == 1) {
        fatouraProducts[i].quantity--;
        fatouraProducts.removeAt(i);
      } else {
        fatouraProducts[i].quantity--;
      }
    }
    fatouraProducts.refresh();
    calculateTotalPrices();
    countAllItems();
    getUnitName();
  }

  void removeItems() {
    fatouraProducts.clear();
    fatouraProducts.refresh();
    calculateTotalPrices();
    countAllItems();
  }

  //! ----------------------------------------

  void getUnitName() {
    unitName.value = '';
    for (var prod in fatouraProducts) {
      unitName.value = prod.unityName!;
    }
  }

  void calculateTotalPrices() {
    price.value = 0.0;
    for (var product in fatouraProducts) {
      // price.value +=
      //     double.parse(prod.price!.replaceAll("\$", "").trim()) * prod.quantity;
      price.value += (double.parse(product.price!.replaceAll("\$", "").trim()) *
              product.quantity) +
          product.tax! /
              100 *
              double.parse(product.price!.replaceAll("\$", "").trim()) *
              product.quantity -
          (product.discount! * product.quantity);
    }
  }

  void discountProduct(int index, double discount) {
    fatouraProducts[index].discount = discount;
    fatouraProducts.refresh();
    calculateTotalPrices();
    countAllItems();
  }

  Widget navigateToCartScreen(BuildContext context) {
    isCartScreen = true;
    isItemListScreen = false;
    return const CartScreen();
  }

  countAllItems() {
    itemCount.value = 0;
    for (var prod in fatouraProducts) {
      // id=count
      itemCount.value += prod.quantity;
    }
  }

  Future<bool> navigateToListItemScreen() async {
    controller.isCartScreen = false;
    controller.isItemListScreen = true;
    return true;
  }
}

class Category {
  Category({
    @required this.id,
    @required this.name,
    @required this.activityId,
  });

  int? id;
  String? name;
  int? activityId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        activityId: json["activity_id"],
      );
}
