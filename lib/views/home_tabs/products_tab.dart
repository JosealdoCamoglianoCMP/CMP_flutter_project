import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/services/product_service.dart';
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.maxFinite,
          height: 64,
          child: TextFormField(
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
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, value, _) {
            if (value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              switch (status) {
                case 200:
                  return Expanded(
                      child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(10),
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
                      rows: lst.map((record) {
                        return TableViewRow(
                          onTap: () {},
                          height: 60,
                          cells: [
                            TableViewCell(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Image.network(
                                      record.images.first.src,
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
                                        record.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TableViewCell(
                              child: Text(record.categories.first.name),
                            ),
                            TableViewCell(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (record.status == 'publish')
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                  const SizedBox(width: 8),
                                  Text(record.status),
                                ],
                              ),
                            ),
                            TableViewCell(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: record.stockStatus == 'instock'
                                      ? Colors.green
                                      : Colors.amber,
                                ),
                                child: Text(record.stockStatus,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            TableViewCell(
                              child: Text(record.stockQuantity == null
                                  ? '0'
                                  : record.stockQuantity.toString()),
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
