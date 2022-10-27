import 'dart:convert';

import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class AddCustomerController extends GetxController{

  var customerName = ''.obs;
  var email = ''.obs;
  var address = ''.obs;
  var phoneNumber = ''.obs;
  var amountBeginIn = ''.obs;
  var amountBeginTo = ''.obs;
  var notes = ''.obs;

  onOkClick() {
    // validate name
    if(
        !customerName.value.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    addCustomer(customerName.value, email.value, address.value, phoneNumber.value, notes.value, amountBeginIn.value, amountBeginTo.value);
    Get.back();
  }

  Future<http.Response> addCustomer(String name,email,address,phone,notes,amountBeginIn,amountBeginTo) async {
    final response = await http.post(
      Uri.parse('https://6o9.live/api/AddCustomer'),
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'adress': address,
        'phone': phone,
        'notes': notes,
        'amount_begin_in': amountBeginIn,
        'amount_begin_to': amountBeginTo,
        'branche_id':sharedPreferences!.getString('Branch_Id')!
      }),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return response;
    } else {
      throw Exception('Failed to add Customer.');
    }
  }
}

class Customer {
  Customer({
    this.customer,
  });

  CustomerClass? customer;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customer: CustomerClass.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer!.toJson(),
  };
}

class CustomerClass {
  CustomerClass({
    this.name,
    this.number,
    this.email,
    this.adress,
    this.phone,
    this.notes,
    this.type,
    this.amountBeginIn,
    this.amountBeginTo,
    this.brancheId,
    this.id,
  });

  String? name;
  int? number;
  dynamic email;
  dynamic adress;
  dynamic phone;
  dynamic notes;
  int? type;
  String? amountBeginIn;
  String? amountBeginTo;
  String? brancheId;
  int? id;

  factory CustomerClass.fromJson(Map<String, dynamic> json) => CustomerClass(
    name: json["name"],
    number: json["number"],
    email: json["email"],
    adress: json["adress"],
    phone: json["phone"],
    notes: json["notes"],
    type: json["type"],
    amountBeginIn: json["amount_begin_in"],
    amountBeginTo: json["amount_begin_to"],
    brancheId: json["branche_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "email": email,
    "adress": adress,
    "phone": phone,
    "notes": notes,
    "type": type,
    "amount_begin_in": amountBeginIn,
    "amount_begin_to": amountBeginTo,
    "branche_id": brancheId,
    "id": id,
  };
}
