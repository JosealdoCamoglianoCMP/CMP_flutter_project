import 'dart:developer';

import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
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

              if (lst.isEmpty) {
                return const Center(
                  child: Text('Lista vacia'),
                );
              } else {
                return SizedBox.expand(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Collection')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Availability')),
                      DataColumn(label: Text('Inventory')),
                      DataColumn(label: Text('...')),
                    ],
                    rows: [
                      ...lst.map((e) => DataRow(cells: [
                            DataCell(Text(e.name)),
                            DataCell(Text(e.categories.first.name)),
                            DataCell(Text(e.status)),
                            DataCell(Text(e.averageRating)),
                            DataCell(Text(e.stockStatus)),
                            const DataCell(Text('xd')),
                          ])),
                      ...lst.map((e) => DataRow(cells: [
                            DataCell(Text(e.name)),
                            DataCell(Text(e.categories.first.name)),
                            DataCell(Text(e.status)),
                            DataCell(Text(e.averageRating)),
                            DataCell(Text(e.stockStatus)),
                            const DataCell(Text('xd')),
                          ]))
                    ],
                  ),
                );
              }
            }
          }
        }
      },
    );
  }
}
