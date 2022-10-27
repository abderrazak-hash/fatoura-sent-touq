import 'package:cloud_toq_system/core/page/branch/branch_model.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BranchController extends GetxController{

  final url = 'https://6o9.live/api/ListBranches';
  List<Branch> branches = [];
  Future<List<Branch>> getBranches(String id)async{
    final response = await http.post(Uri.parse(url),
        body: {
          'user_id': id,
        }
    );
    if(response.statusCode ==200){
      final responseBody = json.decode(response.body);
      var data = responseBody['branches'];

      print(response.body);
      for(var branch in data){
        branches.add(Branch.fromJson(branch));
      }

    }

    else {
      print('Exception');
      return throw Exception();
    }
    return branches;

  }


}