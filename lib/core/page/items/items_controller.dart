import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController{

RxList items = [
  Item(id:0,name: 'العناصر', iconItems: AppAssets.list,
  data: [
    Data(name: 'Paper',iconItems: AppAssets.invoice,discount: '20.00'),
    Data(name: 'Taxi',iconItems: AppAssets.invoice,discount: '20.00')
  ],
  ),
  Category(id:1,name: 'الأصناف', iconItems: AppAssets.categories,
    data: [
      Data(name: 'Book',iconItems: AppAssets.invoice,discount: '2 صنف'),
      Data(name: 'Book',iconItems: AppAssets.invoice,discount: '2 صنف')
    ],
  ),
  Discount(id:2,name: 'الخصومات', iconItems: AppAssets.discounts,
    data: [
      Data(name: 'TV',iconItems: AppAssets.discounts,discount: '0.25 %'),
      Data(name: 'LCD',iconItems: AppAssets.discounts,discount: '0.25 %'),
      Data(name: 'Phone',iconItems: AppAssets.discounts,discount: '0.25 %'),
    ],
  ),
].obs;
}

class Item{
  int? id;
  String? name;
  String? iconItems;
  List<Data>? data;

  Item({this.id, this.name, this.iconItems,this.data});
}
class Category{
  int? id;
  String? name;
  String? iconItems;
  List<Data>? data;
  Category({this.id, this.name, this.iconItems,this.data});
}
class Discount{
  int? id;
  String? name;
  String? iconItems;
  List<Data>? data;

  Discount({this.id, this.name, this.iconItems,this.data});
}

class Data{
  String? name;
  String? iconItems;
  String? discount;

  Data({this.name, this.iconItems,this.discount});
}