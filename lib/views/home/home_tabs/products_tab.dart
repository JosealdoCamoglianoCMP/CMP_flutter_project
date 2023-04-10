import 'dart:developer';

import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/services/product_service.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/widgets/option_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final isLoading = ValueNotifier<bool>(true);
  final isSearching = ValueNotifier<bool>(false);
  final productPage = ValueNotifier<int>(1);
  final lastPage = ValueNotifier<int>(0);

  late PaginationController paginationController =
      PaginationController(rowCount: 0, rowsPerPage: 1);
  List<String> columns = [
    'Name',
    'Collection',
    'Status',
    'Availability',
    'Inventory',
    'Options',
  ];
  late int status;
  late String message;

  List<Product> lst = [];
  List<Product> lstAux = [];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getProducts().then((value) {
        setState(() {
          paginationController =
              PaginationController(rowCount: lst.length, rowsPerPage: 20);
          isLoading.value = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hintText: 'Search product',
              hintStyle: TextStyle(fontSize: 24),
              suffixIcon: Icon(
                Icons.search,
                size: 28,
              ),
            ),
            style: const TextStyle(fontSize: 24),
            onChanged: (s) {
              if (s.isEmpty) {
                lst = lstAux;
                isSearching.value = false;
              } else {
                isSearching.value = true;
              }
              setState(() {
                lst = lst
                    .where(
                        (e) => e.name.toUpperCase().contains(s.toUpperCase()))
                    .toList();
              });
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 32,
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                OptionButton(
                  color: Colors.green,
                  icon: Icons.add,
                  text: 'New',
                  function: () {
                    Get.rootDelegate.toNamed(Routes.productAdd);
                  },
                ),
                const SizedBox(width: 64),
                SizedBox(
                  width: 300,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                    ),
                    items: const [
                      "Brazil",
                      "Italia (Disabled)",
                      "Tunisia",
                      'Canada'
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          labelText: "Category",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                          )),
                    ),
                    onChanged: (s) {},
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 300,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                    ),
                    items: const [
                      "Brazil",
                      "Italia (Disabled)",
                      "Tunisia",
                      'Canada'
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          labelText: "Category",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none,
                          )),
                    ),
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (context, value, _) {
              if (value) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                switch (status) {
                  case 200:
                    return Expanded(
                        child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ScrollableTableView(
                        paginationController:
                            isSearching.value ? null : paginationController,
                        columns: columns.map((column) {
                          return TableViewColumn(
                            minWidth: 300,
                            label: column,
                          );
                        }).toList(),
                        rows: lst.map((product) {
                          return TableViewRow(
                            onTap: () async {
                              await localStorage.setString(
                                  'currentProduct', product.toJson());
                              if (!mounted) return;
                              Get.rootDelegate.toNamed(Routes.productDetail);
                            },
                            height: 60,
                            cells: [
                              TableViewCell(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        product.images.first.src,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      //FadeInImage.assetNetwork(
                                      //  width: 50,
                                      //  height: 50,
                                      //  fit: BoxFit.fill,
                                      //  placeholder: 'assets/cmp_drawer_logo.png',
                                      //  image: record.images.first.src,
                                      //  fadeInDuration: const Duration(
                                      //    milliseconds: 200,
                                      //  ),
                                      //),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          product.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableViewCell(
                                child: Text(product.categories.first.name),
                              ),
                              TableViewCell(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (product.status == 'publish')
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green),
                                      ),
                                    const SizedBox(width: 8),
                                    Text(product.status),
                                  ],
                                ),
                              ),
                              TableViewCell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: product.stockStatus == 'instock'
                                        ? Colors.green
                                        : Colors.amber,
                                  ),
                                  child: Text(product.stockStatus,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              TableViewCell(
                                child: Text(product.stockQuantity == null
                                    ? '0'
                                    : product.stockQuantity.toString()),
                              ),
                              TableViewCell(
                                  child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    color: Colors.red,
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  )
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ));
                  case 400:
                    return Text('400');
                  case 500:
                    return Text('500');
                  default:
                    return Text('404');
                }
              }
            },
          ),
          if (isSearching.value == false)
            ValueListenableBuilder(
                valueListenable: paginationController,
                builder: (context, value, _) {
                  return Row(
                    children: [
                      const Spacer(),
                      Text(
                          "${paginationController.currentPage} of ${paginationController.pageCount}"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: paginationController.currentPage <= 1
                                ? null
                                : () {
                                    paginationController.previous();
                                  },
                            iconSize: 20,
                            splashRadius: 20,
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: paginationController.currentPage <= 1
                                  ? Colors.black26
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: paginationController.currentPage >=
                                    paginationController.pageCount
                                ? () async {
                                    isLoading.value = true;
                                    productPage.value = productPage.value + 1;
                                    lastPage.value = lastPage.value + 3;
                                    await getProducts();
                                    paginationController = PaginationController(
                                        rowCount: lst.length, rowsPerPage: 20);
                                    paginationController
                                        .jumpTo(lastPage.value + 1);
                                    setState(() {});
                                    isLoading.value = false;
                                  }
                                : () {
                                    paginationController.next();
                                  },
                            iconSize: 20,
                            splashRadius: 20,
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: paginationController.currentPage >=
                                      paginationController.pageCount
                                  ? Colors.black26
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
        ],
      ),
    );
  }

  Future getProducts() async {
    final r = await ProductService().getProducts(productPage.value);
    if (r['success']) {
      final List<Product> data = r['data'];
      lst.addAll(data);
      lstAux.addAll(data);
      status = r['status'];
      log(lst.length.toString());
    } else {
      status = r['status'];
      message = r['message'];
    }
  }
}
