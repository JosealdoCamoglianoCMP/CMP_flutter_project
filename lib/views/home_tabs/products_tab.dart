import 'dart:developer';

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
  @override
  Widget build(BuildContext context) {
    List<String> columns = [
      'Name',
      'Collection',
      'Status',
      'Availability',
      'Inventory',
      '...',
    ];
    return FutureBuilder(
      future: ProductService().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            //TODO: 500 >= TAB
            return const Center(
              child: Text('ERROR'),
            );
          } else {
            if (!snapshot.hasData) {
              //TODO: 400 >=  x < 500 TAB
              return const Center(
                child: Text('ERROR'),
              );
            } else {
              List<Product> lst = snapshot.data['data'];
              List<Product> lstAux = snapshot.data['data'];

              if (lst.isEmpty) {
                return const Center(
                  child: Text('Lista vacia'),
                );
              } else {
                return LayoutBuilder(builder: (context, _) {
                  final width = MediaQuery.of(context).size.width;

                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ScrollableTableView(
                      columns: columns.map((column) {
                        return TableViewColumn(
                          minWidth: width / 6,
                          label: column,
                        );
                      }).toList(),
                      rows: lst.map((record) {
                        return TableViewRow(height: 60, cells: [
                          TableViewCell(
                            child: Text(record.name),
                          ),
                          TableViewCell(
                            child: Text(record.categories.first.name),
                          ),
                          TableViewCell(
                            child: Text(record.status),
                          ),
                          TableViewCell(
                            child: Text(record.averageRating),
                          ),
                          TableViewCell(
                            child: Text(record.stockStatus),
                          ),
                          TableViewCell(
                            child: const Text('xd'),
                          ),
                        ]);
                      }).toList(),
                    ),
                  );
                });
              }
            }
          }
        }
      },
    );
  }
}
