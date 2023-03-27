import 'package:cmp_flutter_web/providers/auth_provider.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/views/login_view.dart';
import 'package:flutter/material.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cloud Media Pro Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //        fontFamily: 'OoohBaby',
        ),
        routes: AppRoutes.routes,
        initialRoute: LoginView.route,
      ),
    );
  }
}
