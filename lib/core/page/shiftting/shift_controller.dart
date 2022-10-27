import 'package:cloud_toq_system/core/page/shiftting/shfit.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShiftController extends GetxController{


  final urlProduct = 'https://6o9.live/api/WorkTime';

  Future<List<Shfit>> getShift(String user_id,String branch_id) async {
    List<Shfit> shifts = [];
    final response = await http.post(Uri.parse(urlProduct), body: {
      'user_id': user_id,
      'branch_id':branch_id
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(response.body);
      for (var product in responseBody) {
        shifts.add(Shfit.fromJson(product));
      }

    } else {
      print('Exception');
      return throw Exception();
    }

    return shifts;
  }

}