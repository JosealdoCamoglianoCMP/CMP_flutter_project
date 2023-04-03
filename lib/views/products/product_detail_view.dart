import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/views/home/home_view.dart';
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
    // final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(
        //    onPressed: () => Get.rootDelegate.offNamed(Routes.home),
        //    icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(product.name),
      ),
    );
  }
}
