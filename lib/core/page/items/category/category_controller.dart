import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryController extends GetxController{

  List<CategoryModel> list = [
    CategoryModel(
        color: AppColors.current.secondary,
        title: 'اسم الصنف',
        department: 'اسم القسم',
        typeCategory: 'منتج',
        buyPrice: 55.00,
        sellPrice: 50.00,
        serialItem: 23241201,
        type: 'كرتون',
        date: '13/6/2022',
        totalPrice: 50.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs),
    CategoryModel(
        color: AppColors.current.text,
        title: 'اسم الصنف',
        department: 'اسم القسم',
        typeCategory: 'منتج',
        buyPrice: 55.00,
        sellPrice: 50.00,
        serialItem: 23241201,
        type: 'كرتون',
        date: '14/7/2022',
        totalPrice: 50.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs),
    CategoryModel(
        color: AppColors.current.primary,
        title: 'اسم الصنف',
        department: 'اسم القسم',
        typeCategory: 'منتج',
        buyPrice: 55.00,
        sellPrice: 50.00,
        serialItem: 23241201,
        type: 'كرتون',
        date: '14/7/2022',
        totalPrice: 50.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs)
  ].obs;

  Rx<List<ProductElement>> foundList = Rx<List<ProductElement>>([]);
  @override
  void onInit() {
    super.onInit();
    foundList.value = productsApi;
  }
  final urlProduct = 'https://6o9.live/api/Product';
  List<ProductElement> productsApi = [];
  Future<List<ProductElement>> getProducts(String id) async {

    final response = await http.post(Uri.parse(urlProduct), body: {
      'category_id': id,
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['Products'];
      print(response.body);
      for (var product in data) {
        productsApi.add(ProductElement.fromJson(product));
      }

    } else {
      print('Exception');
      return throw Exception();
    }

    return productsApi;
  }
  void filterCategory(String title) {
    List<ProductElement> results = [];
    if (title.isEmpty) {
      results = productsApi;
    } else {
      results = productsApi
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(title.toLowerCase()))
          .toList();
    }
    foundList.value = results;
  }

}

class CategoryModel{
  Color color;
  String title;
  String department;
  String typeCategory;
  double buyPrice;
  double sellPrice;
  int serialItem;
  String type;
  String date;
  double totalPrice;
  double tax;
  double paidPrice;
  double remainingPrice;
  RxBool isExpanded;
  CategoryModel({
    required this.color,
    required this.title,
    required this.department,
    required this.typeCategory,
    required this.buyPrice,
    required this.sellPrice,
    required this.serialItem,
    required this.type,
    required this.date,
    required this.totalPrice,
    required this.tax,
    required this.paidPrice,
    required this.remainingPrice,
    required this.isExpanded});
}