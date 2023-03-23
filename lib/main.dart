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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
