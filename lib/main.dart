import 'package:cmp_flutter_web/providers/auth_provider.dart';
import 'package:cmp_flutter_web/shared/helpers/scroll_behavior_helper.dart';
import 'package:cmp_flutter_web/shared/routes/app_router_delegate.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/shared/theme/app_theme.dart';
import 'package:cmp_flutter_web/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localStorage = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => AuthProvider())),
      ],
      child: GetMaterialApp.router(
        scrollBehavior: ScrollBehaviorHelper(),
        debugShowCheckedModeBanner: false,
        title: 'Cloud Media Pro Dashboard',
        theme: AppTheme.principalAppTheme,
        defaultTransition: Transition.noTransition,
        getPages: AppPages.pages,
        routerDelegate: AppRouterDelegate(),
      ),
    );
  }
}
