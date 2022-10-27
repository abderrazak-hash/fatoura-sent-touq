import 'package:cloud_toq_system/core/page/items/department/department_controller.dart';
import 'package:get/get.dart';

class DepartmentBinding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut<DepartmentController>(() => DepartmentController());
  }

}