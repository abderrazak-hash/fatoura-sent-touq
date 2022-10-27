import 'package:cloud_toq_system/core/page/items/department_add/department_add_controller.dart';
import 'package:get/get.dart';

class DepartmentAddBinding extends Bindings{
  @override
  void dependencies() {
      Get.lazyPut<DepartmentAddController>(() => DepartmentAddController());
  }

}