import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/services/product_service.dart';
import 'package:cmp_flutter_web/views/product_views.dart/product_add_view.dart';
import 'package:cmp_flutter_web/views/product_views.dart/product_detail_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final isLoading = ValueNotifier<bool>(true);

  List<String> columns = [
    'Name',
    'Collection',
    'Status',
    'Availability',
    'Inventory',
    '...',
  ];
  late int status;
  late String message;

  List<Product> lst = [];
  List<Product> lstAux = [];

  @override
  void initState() {
    getProducts().then((value) => isLoading.value = false);
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
              if (s.isEmpty) lst = lstAux;
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
                FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Colors.green,
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () {
                    Navigator.pushNamed(context, ProductAddView.route);
                  },
                  label: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 4),
                      Text(
                        'New',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
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
                    onChanged: (s) {},
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
                        columns: columns.map((column) {
                          return TableViewColumn(
                            minWidth: 300,
                            label: column,
                          );
                        }).toList(),
                        rows: lst.map((product) {
                          return TableViewRow(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductDetailView.route,
                                  arguments: product);
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
                                child: const Text('xd'),
                              ),
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
        ],
      ),
    );
  }

  Future getProducts() async {
    final r = await ProductService().getProducts();
    if (r['success']) {
      lst = r['data'];
      status = r['status'];

      lstAux = r['data'];
    } else {
      status = r['status'];
      message = r['message'];
    }
  }
}
