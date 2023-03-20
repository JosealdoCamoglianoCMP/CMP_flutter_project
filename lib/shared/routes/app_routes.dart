import 'package:cmp_flutter_web/views/home_view.dart';
import 'package:cmp_flutter_web/views/login_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = <String, WidgetBuilder>{
    LoginView.route: (_) => const LoginView(),
    HomeView.route: (_) => const HomeView(),
  };
}
