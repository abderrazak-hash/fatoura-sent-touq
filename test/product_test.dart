
import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

 class MockProductController extends ProductController with Mock{}
// class MockProduct extends Product with Mock{
//   MockProduct(super.name, super.category, super.price, super.color, super.count, super.image);
// }
// void main(){
//   MockProductController controller = MockProductController();
//   group('Test Object and values in Product Controller', () {
//   MockProduct product = MockProduct('TV', 'Media', '1000.0', Colors.red, 0, AppAssets.background);
//   test('Found Object', (){
//     expect(product.name, 'TV');
//   });
//   // test('Found Object', (){
//   //   expect(product.name, 'CC');
//   // });
//  test('add Item', (){
//   // controller.addItem(product);
//  });
//   test('contain Item', (){
//     controller.foundItems.contains(product);
// //   });
//  });
// }