import 'package:cloud_toq_system/core/page/branch/branch_controller.dart';
import 'package:get/get.dart';

class BranchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BranchController>(() => BranchController());
  }


}