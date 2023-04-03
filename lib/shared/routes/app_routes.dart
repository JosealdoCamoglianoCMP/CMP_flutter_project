import 'package:cmp_flutter_web/views/home/home_view.dart';
import 'package:cmp_flutter_web/views/login_view.dart';
import 'package:cmp_flutter_web/views/products/product_add_view.dart';
import 'package:cmp_flutter_web/views/products/product_detail_view.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const signIn = '/';
  static const home = '/home';
  static const productAdd = '/add_product';
  static const productDetail = '/product_detail';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.signIn,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.productAdd,
      page: () => const ProductAddView(),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => const ProductDetailView(),
    )
  ];
}
