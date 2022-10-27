import 'package:cloud_toq_system/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../product/product_controller.dart';

class DepartmentController extends GetxController{

  final url = 'https://6o9.live/api/Category';
  List<Category> categories = [];
  Future<List<Category>> getCategories(String id) async {

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
      sharedPreferences!.setString('idCategory', id);
      print('iddddddddddddddddddddddddd $id');
    } else {
      print('Exception');
      return throw Exception();
    }
    return categories;
  }



  Rx<List<Category>> foundList = Rx<List<Category>>([]);
  @override
  void onInit() {
    super.onInit();
    foundList.value = categories;
  }
  void filterDepartment(String department) {
    List<Category> results = [];
    if (department.isEmpty) {
      results = categories;
    } else {
      results = categories
          .where((element) => element.name
          .toString()
          .toLowerCase()
          .contains(department.toLowerCase()))
          .toList();
    }
    foundList.value = results;
  }
}

