import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/providers/auth_provider.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:cmp_flutter_web/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const route = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var name = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final user = StrapiUserModel.fromJson(localStorage.getString('user')!);
      name = user.user.username;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 233, 250),
      drawerScrimColor: Colors.transparent,
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Text(authProvider.user!.user.username),
            ),
          ),
        ],
      ),
    );
  }
}
