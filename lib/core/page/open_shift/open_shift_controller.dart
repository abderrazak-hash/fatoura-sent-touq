import 'dart:convert';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OpenShiftController extends GetxController{

  var isSelect = true.obs;
  var amount = ''.obs;
  var notes = ''.obs;

void selectedAgree(value){
  isSelect != isSelect;
}

  late Future<OpenShfit> future;
  @override
  void onInit() {
    super.onInit();
    future = callLoginApi(amount.value,notes.value);

  }

  onLoginClick() {

    if(!amount.value.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    callLoginApi(amount.value,notes.value).then((value) =>
    Get.to(ProductListScreen(),));

  }



  final _baseUrl = "https://6o9.live/api/OpenWorkTime";
  Future<OpenShfit> callLoginApi(String amount, String notes) async {

  //  try {
      final response = await http.post(Uri.parse(_baseUrl), body: {
        'user_device_id':Get.arguments['device_id'],
        //'user_device_id':Get.arguments['user_device_id'],
        'user_id':Get.arguments['USER_ID'],
        'branch_id':Get.arguments['branching_id'],
        'device_id':Get.arguments['device_id'],
        'AmountStart': amount,
        'note':notes,
      });
      if (response.statusCode == 201) {
        print('yes');
        print(response.body.toString());
        return OpenShfit.fromJson(json.decode(response.body));
      } else {
        print(response.body.toString());
        throw Exception('Failed to create open shift.');
      }

  }

}


class OpenShfit {
  OpenShfit({
    required this.number,
    required this.userId,
    required this.deviceId,
    required this.branchId,
    required this.dateOpen,
    required this.timeOpen,
    required this.amountOpen,
    required this.status,
    required this.id,
  });

  int number;
  String userId;
  String deviceId;
  dynamic branchId;
  DateTime dateOpen;
  String timeOpen;
  String amountOpen;
  String status;
  int id;

  factory OpenShfit.fromJson(Map<String, dynamic> json) => OpenShfit(
    number: json["Number"],
    userId: json["user_id"],
    deviceId: json["device_id"],
    branchId: json["branch_id"],
    dateOpen: DateTime.parse(json["date_open"]),
    timeOpen: json["time_open"],
    amountOpen: json["amount_open"],
    status: json["status"],
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
    "id": id,
  };
}
