import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:cmp_flutter_web/views/home/home_view.dart';
import 'package:cmp_flutter_web/widgets/option_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    super.key,
  });
  static const route = 'product_detail_view';
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late Product product;
  @override
  void initState() {
    product = Product.fromJson(localStorage.getString('currentProduct')!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.textBlue,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: OptionButton(
              color: Colors.blue,
              icon: Icons.edit,
              text: 'Edit',
              function: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: OptionButton(
              color: Colors.red,
              icon: Icons.delete,
              text: 'Delete',
              function: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              width: 450,
              height: 450,
              color: Colors.red,
            ),
            Container(
              width: 450,
              height: 450,
              color: Colors.amber,
            ),
            Container(
              width: 450,
              height: 450,
              color: Colors.green,
            ),
            Container(
              width: 450,
              height: 450,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
