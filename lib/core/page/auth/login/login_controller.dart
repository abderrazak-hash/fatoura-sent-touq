import 'dart:convert';
import 'dart:io';

import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/core/page/auth/login/login_view.dart';
import 'package:cloud_toq_system/core/page/branch/branch_view.dart';
import 'package:cloud_toq_system/core/page/items/items_controller.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/page/profile/profile_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/dialog/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  var userName = ''.obs;
  var password = ''.obs;
  var loginLoading = false.obs;


  onLoginClick() {
    // validate name
    if(!userName.value.isNotEmpty){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    callLoginApi(userName.value, password.value);

  }

  final ApiResponse _apiResponse =  ApiResponse();

  final _baseUrl = "https://6o9.live/api/LoginApp";
  Future<ApiResponse> callLoginApi(String username, String password) async {

    try {
      final response = await http.post(Uri.parse(_baseUrl), body: {
        'UserName': username,
        'password': password,
      });
      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromMap(json.decode(response.body));
          Get.snackbar('\u{1F642}', 'تم الدخول بنجاح',
            colorText: Colors.white,
            snackStyle:SnackStyle.FLOATING,
            backgroundColor: AppColors.current.success,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(microseconds: 500)
          );
          //sharedPreferences!.setString('UserName', username);
          //sharedPreferences!.setString('fullName',  (_apiResponse.Data as User).user!.fullName!);
          //sharedPreferences!.setString('avatar',  (_apiResponse.Data as User).user!.avatar!);
          sharedPreferences!.setInt('id', (_apiResponse.Data as User).user!.id!);
          sharedPreferences!.setString('username',  (_apiResponse.Data as User).user!.username!);
          //sharedPreferences!.setString('mobile',  (_apiResponse.Data as User).user!.mobile!);
          print((_apiResponse.Data as User).user!.id!);
          Get.off(BranchView(),arguments:
           {
             'user_id': ((_apiResponse.Data as User).user!.id.toString()),
           }
          );
          //Get.offNamed(Routes.PRODUCT);
          break;
        case 401:
          Get.snackbar('Error', 'Please check data');
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          break;
        default:
          Get.snackbar('\u{1F643}', 'من فضلك تأكد من صحة البيانات!',
            colorText: Colors.white,
            snackStyle:SnackStyle.FLOATING,
            backgroundColor: AppColors.current.success,
            snackPosition: SnackPosition.BOTTOM,
          );
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          break;
      }
    } on SocketException {
      Get.snackbar('\u{1F643}', 'لا يتوفر اتصال بالانترنت',
        colorText: Colors.white,
      snackStyle:SnackStyle.FLOATING,
      backgroundColor: AppColors.current.success,
        snackPosition: SnackPosition.BOTTOM,
      );
      _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
    }
    return _apiResponse;
  }

}


class ApiResponse {
   Object? _data;
  late Object _apiError;

  Object get Data => _data!;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
}
class ApiError {
  String? _error;

  ApiError({String? error}) {
    _error = error;
  }

  String get error => _error!;
  set error(String error) => _error = error;

  ApiError.fromJson(Map<String, dynamic> json) {
    _error = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _error;
    return data;
  }
}
class User {
  User({
    this.user,
    this.message,
  });

  UserClass? user;
  String? message;

  factory User.fromMap(Map<String, dynamic> json) => User(
    user: UserClass.fromMap(json["user"]),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "user": user!.toMap(),
    "message": message,
  };
}
class UserClass {
  UserClass({
    this.id,
    this.username,
    this.fullName,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.userRoleId,
    this.companyId,
    this.avatar,
    this.media,
  });

  int? id;
  String? username;
  String? fullName;
  String? mobile;
  String? email;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  int? status;
  dynamic notes;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userRoleId;
  int? companyId;
  String? avatar;
  List<dynamic>? media;

  factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    username: json["username"],
    fullName: json["full_name"],
    mobile: json["mobile"]??'لا يوجد رقم جوال',
    email: json["email"]??'لا يوجد ايميل',
    emailVerifiedAt: json["email_verified_at"],
    twoFactorSecret: json["two_factor_secret"],
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
    status: json["status"],
    notes: json["notes"],
    userRoleId: json["user_role_id"],
    companyId: json["company_id"],
    avatar: json["avatar"],
    media: List<dynamic>.from(json["media"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "full_name": fullName,
    "mobile": mobile,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "two_factor_secret": twoFactorSecret,
    "two_factor_recovery_codes": twoFactorRecoveryCodes,
    "status": status,
    "notes": notes,
    "user_role_id": userRoleId,
    "company_id": companyId,
    "avatar": avatar,
    "media": List<dynamic>.from(media!.map((x) => x)),
  };
}

