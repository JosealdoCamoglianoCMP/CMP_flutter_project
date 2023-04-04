import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:cmp_flutter_web/views/products/product_widgets/product_image_widget.dart';
import 'package:cmp_flutter_web/views/products/product_widgets/product_info.dart';
import 'package:cmp_flutter_web/widgets/option_button.dart';
import 'package:flutter/material.dart';

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
    final width = MediaQuery.of(context).size.width;

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
      body: width <= 700
          ? SizedBox.expand(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  ProductImageWidget(url: product.images.first.src),
                  ProductInfoWidget(product: product, width: width),
                  Container(
                    width: double.maxFinite,
                    height: 500,
                    color: Colors.red,
                    child: Text('Hola'),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 500,
                    color: Colors.red,
                    child: Text('Hola'),
                  ),
                ],
              )),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [
                    ProductImageWidget(
                      url: product.images.first.src,
                      witdh: 400,
                      height: 400,
                    ),
                    ProductInfoWidget(product: product, width: width),
                    Container(
                      height: 400,
                      color: Colors.green,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'GREEN',
                            style: TextStyle(fontSize: 150),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 450,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
