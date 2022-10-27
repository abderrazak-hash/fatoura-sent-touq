import 'dart:convert';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../route/app_pages.dart';

class CloseShiftController extends GetxController{

  var isSelect = true.obs;
  var amount = ''.obs;
  var notes = ''.obs;

void selectedAgree(value){
  isSelect != isSelect;
}

  onLoginClick() {

    callLoginApi().then((value) =>
    Get.toNamed(Routes.BRANCH));

  }



  final _baseUrl = "https://6o9.live/api/closeWorkTime";
  Future<CloseShift> callLoginApi() async {

  //  try {
      final response = await http.post(Uri.parse(_baseUrl), body: {
        'Worktime_id': 325,
        'AmountStart': '100',
      });
      if (response.statusCode == 200) {
        print('yes');
        print(response.body.toString());
        return CloseShift.fromJson(json.decode(response.body));
      } else {
        print('Failed to create close shift.');
        throw Exception('Failed to create close shift.');
      }
  }

}



class CloseShift {
  CloseShift({
    required  this.number,
    required this.userId,
    required this.deviceId,
    required this.branchId,
    required this.dateOpen,
    required this.timeOpen,
    required this.amountOpen,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
   required this.id,
  });

  int number;
  String userId;
  String deviceId;
  String branchId;
  DateTime dateOpen;
  String timeOpen;
  String amountOpen;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory CloseShift.fromJson(Map<String, dynamic> json) => CloseShift(
    number: json["Number"],
    userId: json["user_id"],
    deviceId: json["device_id"],
    branchId: json["branch_id"],
    dateOpen: DateTime.parse(json["date_open"]),
    timeOpen: json["time_open"],
    amountOpen: json["amount_open"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Number": number,
    "user_id": userId,
    "device_id": deviceId,
    "branch_id": branchId,
    "date_open": "${dateOpen.year.toString().padLeft(4, '0')}-${dateOpen.month.toString().padLeft(2, '0')}-${dateOpen.day.toString().padLeft(2, '0')}",
    "time_open": timeOpen,
    "amount_open": amountOpen,
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

