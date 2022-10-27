import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ReceiptsController extends GetxController{
  final url = 'https://6o9.live/api/ListSelles';
  Future<List< Sales>> getSales(String id) async {
    List< Sales> sales = [];
    final response = await http.post(Uri.parse(url), body: {
      'branche_id': id,
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var data = responseBody['data'];

      print(response.body);
      for (var sale in data) {
        sales.add(Sales.fromJson(sale));
      }
      print('Branch iddddddddddddddddddddddddd $id');
    } else {
      print('Exception');
      return throw Exception();
    }
    return sales;
  }

  List<Receipts> list = [
    Receipts(title: 'فاتورة ضريبة مبسطة',
        numberOfInvoice: 1,
        date: '13/6/2022',
        totalPrice: 1200.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs),
    Receipts(title: 'فاتورة ضريبة مبسطة',
        numberOfInvoice: 1,
        date: '13/6/2022',
        totalPrice: 1200.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs),
    Receipts(title: 'فاتورة ضريبة ',
        numberOfInvoice: 2,
        date: '14/7/2022',
        totalPrice: 1200.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs),
    Receipts(title: 'فاتورة ضريبة ',
        numberOfInvoice: 2,
        date: '14/7/2022',
        totalPrice: 1200.00,
        paidPrice: 800.00,
        remainingPrice: 400.00,
        tax: 120.00,
        isExpanded: false.obs)
  ].obs;

  Rx<List<Receipts>> foundList = Rx<List<Receipts>>([]);
  @override
  void onInit() {
    super.onInit();
    foundList.value = list;
  }
  void filterReceipts(String receiptTitle) {
    List<Receipts> results = [];
    if (receiptTitle.isEmpty) {
      results = list;
    } else {
      results = list
          .where((element) => element.title
          .toString()
          .toLowerCase()
          .contains(receiptTitle.toLowerCase()))
          .toList();
    }
    foundList.value = results;
  }
}


class Receipts{
  String title;
  int numberOfInvoice;
  String date;
  double totalPrice;
  double tax;
  double paidPrice;
  double remainingPrice;
  RxBool isExpanded;
  Receipts({required this.title,
    required this.numberOfInvoice,
    required this.date,
    required this.totalPrice,
    required this.tax,
    required this.paidPrice,
    required this.remainingPrice,
    required this.isExpanded});
}



class Sales {
  Sales({
    required this.isExpanded,
    this.id,
    this.numberSelle,
    this.typeInvoice,
    this.count,
    this.dateRelease,
    this.timeRelease,
    this.tax,
    this.total,
    this.paid,
    this.rest,
  });
  RxBool isExpanded;
  int? id;
  String? numberSelle;
  String? typeInvoice;
  int? count;
  String? dateRelease;
  String? timeRelease;
  String? tax;
  String? total;
  String? paid;
  String? rest;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
    id: json["id"],
    numberSelle: json["number_selle"],
    typeInvoice: json["type_invoice"],
    count: json["count"],
    dateRelease:json["date_release"],
    timeRelease: json["time_release"],
    tax: json["tax"],
    total: json["total"],
    paid: json["paid"],
    rest: json["rest"],
  isExpanded: false.obs
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number_selle": numberSelle,
    "type_invoice": typeInvoiceValues.reverse[typeInvoice],
    "count": count,
    "date_release": "${dateRelease!.toString().padLeft(4, '0')}-${dateRelease!.toString().padLeft(2, '0')}-${dateRelease!.toString().padLeft(2, '0')}",
    "time_release": timeRelease,
    "tax": tax,
    "total": total,
    "paid": paid,
    "rest": rest,
  };
}

enum TypeInvoice { EMPTY, TYPE_INVOICE }

final typeInvoiceValues = EnumValues({
  "مبسطة": TypeInvoice.EMPTY,
  "ضريبية": TypeInvoice.TYPE_INVOICE
});

class Input {
  Input({
    this.brancheId,
  });

  String? brancheId;

  factory Input.fromJson(Map<String, dynamic> json) => Input(
    brancheId: json["branche_id"],
  );

  Map<String, dynamic> toJson() => {
    "branche_id": brancheId,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
