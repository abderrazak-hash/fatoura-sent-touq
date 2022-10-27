// import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/product/product.dart';
import 'package:cloud_toq_system/core/page/product/product_controller.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/core/route/app_pages.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cloud_toq_system/utils/search.dart';

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String idCategory = '0';
  Category? mySelection;
  late Future<List<Category>> _future;

  String filter = '';

  void initData() async {
    List<Category> cats = await _future;
    setState(() {
      mySelection = cats.first;
      idCategory = mySelection!.id.toString();
      controller.getProducts(mySelection!.id.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    controller.searchController = TextEditingController()
      ..addListener(() {
        controller.filterItem(controller.searchController.text);
      });
    //  idCategory = sharedPreferences!.getString('idCategory')!;
    _future =
        controller.getCategories(sharedPreferences!.getString('key_branch')!);
    initData();
  }

  int number = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuView(),
      body: Stack(
        children: [
          Image.asset(AppAssets.background_app),
          Column(
            children: [
              _buildToolbar(context),
              Empty(
                height: 12,
              ),
              _buildPayment(),
              _buildDivider(),
              _buildQrSearchDrop(context),
              _buildListItems(),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildToolbar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.current.primary,
      leadingWidth: 40,
      elevation: 0.0,
      titleSpacing: 0,
      foregroundColor: AppColors.current.success,
      toolbarHeight: 70,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: controller.navigateToCartScreen,
                ),
              );
            },
            child: Container(
                alignment: Alignment.center,
                width: 96,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.current.success,
                      width: 3,
                    )),
                child: Obx(
                  () => Text(
                    "الفاتورة ${controller.itemCount.value}",
                    style: TextStyle(
                        color: AppColors.current.success,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Tajawal'),
                  ),
                )),
          ),
          Empty(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.INVOICEITEMS);
            },
            child: SvgPicture.asset(
              AppAssets.form,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.INVOICEWAIT,
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 6),
            alignment: Alignment.center,
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.current.success, width: 3)),
            child: Text(
              number.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.current.success,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Tajawal'),
            ),
          ),
        ),
        Empty(
          width: 4,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (controller.itemCount > 0) {
                number = 4;
                controller.removeItems();
              }
            });
          },
          child: SvgPicture.asset(
            AppAssets.add,
            width: 44,
            height: 44,
          ),
        ),
        Empty(
          width: 4,
        ),
      ],
    );
  }

  Widget _buildPayment() {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.PAYMENT);
        },
        child: Container(
          width: 345,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.current.primary,
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'السداد',
                style: TextStyle(
                    color: AppColors.current.success,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    fontFamily: 'Tajawal'),
              ),
              Obx(() {
                return Text(
                  controller.price.value.toString(),
                  style: TextStyle(
                      color: AppColors.current.success,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      fontFamily: 'Tajawal'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
          Divider(color: AppColors.current.primary, height: 1, thickness: 0.5),
    );
  }

  Widget _buildQrSearchDrop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0.0, top: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              height: 100,
              child: FutureBuilder<List<Category>>(
                future: _future,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center();

                    case ConnectionState.active:
                      return const Center();

                    case ConnectionState.none:
                      // handel connection error
                      return Text(' error ');

                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        // handel error
                        return Text('snapshot.error');
                      } else {
                        if (snapshot.hasData) {
                          return DropdownButtonHideUnderline(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    color: AppColors.current.text,
                                    fontFamily: 'Tajawal',
                                    fontSize: 16.0),
                                fillColor:
                                    AppColors.current.dimmed.withOpacity(0.8),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(
                                      color: AppColors.current.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(
                                      color: AppColors.current.transparent),
                                ),
                              ),
                              child: DropdownButton<Category>(
                                //hint: Text(snapshot.data!.first.name!,
                                hint: Text(
                                  'إختر الفئة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.current.text),
                                ),
                                icon: SvgPicture.asset(
                                  AppAssets.drop,
                                  fit: BoxFit.fitHeight,
                                ),
                                isExpanded: true,
                                elevation: 10,
                                iconEnabledColor: AppColors.current.primary,
                                items: [
                                  ...snapshot.data!.map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.name!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Tajawal',
                                              color: AppColors.current.text),
                                        ),
                                      )),
                                ],

                                onChanged: (newValue) {
                                  setState(() {
                                    mySelection = newValue;
                                    controller
                                        .getProducts(newValue!.id.toString());
                                    idCategory = newValue.id.toString();
                                    filter = '';
                                    print(filter);
                                    // print('idCategory $idCategory');
                                  });
                                },
                                value: mySelection,
                              ),
                            ),
                          );
                        } else {
                          // handel empty data
                          return Center(
                            child: Text(
                              'no data found',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: AppColors.current.text),
                            ),
                          );
                        }
                      }
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 1.65, top: 36),
            child: SvgPicture.asset(
              AppAssets.qr,
            ),
          ),
         // _buildSearchItem1(context),
           _buildSearch()
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 1.3, top: 36),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.current.dimmed),
        child: Icon(
          Icons.search,
          color: AppColors.current.primary,
          size: 36,
        ),
      ),
    );
  }

  Widget _buildSearchItem1(context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: AnimSearchBar(
        width: MediaQuery.of(context).size.width,
        textController: controller.searchController,
        // onSuffixTap: () {
        //   setState(() {
        //     controller.searchController.clear();
        //   });
        // },
        // onSuffixTap: () {
        //
        // },
        onChanged: (value) {
          // setState(() {
          //   filter = value;
          //   print(filter);
          // });
        },
        onSuffixTap: null,
        color: AppColors.current.background,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.current.primary,
          size: 30,
        ),
         //closeSearchOnSuffixTap: true,
        animationDurationInMilli: 1000,
        rtl: false,
      ),
    );
  }

  int crossAxisCount = 3;
  double aspectRatio = 1;
  Widget _buildListItems() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(viewType == ViewType.list
                      ? Icons.grid_on
                      : Icons.view_list),
                  onTap: () {
                    if (viewType == ViewType.list) {
                      crossAxisCount = 3;
                      aspectRatio = 1;
                      viewType = ViewType.grid;
                    } else {
                      crossAxisCount = 1;
                      aspectRatio = 4;
                      viewType = ViewType.list;
                    }
                    setState(() {});
                  },
                ),
                Text(
                  viewType == ViewType.list ? "عرض كشبكة" : "عرض كقائمة",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.current.text,
                      fontFamily: "Tajawal"),
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<ProductElement>>(
                    future: controller.getProducts(idCategory),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        case ConnectionState.active:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        case ConnectionState.none:
                          // handel connection error
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        case ConnectionState.done:
                          if (snapshot.error != null) {
                            // handel error
                            // return  Text(snapshot.error.toString());
                            return Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Tajawal',
                                    color: AppColors.current.text),
                              ),
                            );
                          } else {
                            if (snapshot.data!.isEmpty) {
                              return Center(
                                child: Text(
                                  'لا توجد منتجات فارغة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.current.text),
                                ),
                              );
                            } else {
                              // handel empty data
                              List<ProductElement> filtereData = snapshot.data!
                                  .where(
                                    (element) => element.name
                                        .toString()
                                        .contains(filter),
                                  )
                                  .toList();
                              return GridView.count(
                                crossAxisCount: crossAxisCount,
                                childAspectRatio: aspectRatio,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 6,
                                padding: const EdgeInsets.only(top: 8),
                                children: List.generate(
                                  filtereData.length,
                                  (index) {
                                    ProductElement product =
                                        snapshot.data![index];

                                    return InkWell(
                                        onTap: () {
                                          controller.addToFatoura(product);
                                          // controller.increase(index);
                                          print(controller.itemCount);
                                        },
                                        child: getGridItem(product));
                                  },
                                ),
                              );
                            }
                          }
                      }
                    }

                    // child: GridView.count(
                    //   crossAxisCount: crossAxisCount,
                    //   childAspectRatio: aspectRatio,
                    //   mainAxisSpacing: 6,
                    //   crossAxisSpacing: 6,
                    //   padding: const EdgeInsets.only(top: 8),
                    //   children: List.generate(controller.products.length, (index) =>
                    //       InkWell(
                    //           onTap: (){
                    //             controller.increase(index);
                    //           },
                    //           child: getGridItem(controller.products[index]))
                    //   ),
                    // ),
                    )),
          ],
        ),
      ),
    );
  }

  ViewType viewType = ViewType.grid;
  GridTile getGridItem(ProductElement product) {
    sharedPreferences!.setString('id_unitName', product.id.toString());
    print('id_Product ${product.id.toString()}');
    return GridTile(
      child: (viewType == ViewType.list)
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                height: 300,
                margin: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    Container(
                      width: 75,
                      height: 236,
                      decoration: BoxDecoration(
                          // color: product.color,
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.current.text,
                              fontFamily: "Tajawal"),
                        ),
                        Text(
                          // product.category,
                          product.price!,
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.current.text,
                              fontFamily: "Tajawal"),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      //"${product.price }SAR",
                      "${product.price}SAR",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.current.primary,
                          fontFamily: "Tajawal"),
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.current.dimmedLight.withOpacity(0.2),
                  border: Border.all(
                      width: 1, color: AppColors.current.dimmedLight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  product.name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.current.text,
                      fontFamily: "Tajawal"),
                ),
              ),
            ),
    );
  }
}

enum ViewType { grid, list }
