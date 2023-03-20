import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const route = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textFieldBackColor,
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            child: Image.asset('assets/cmp_drawer_logo.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [],
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/cmp_drawer_logo.png'),
                  const SizedBox(width: 8),
                  Text(
                    'Cloud Media Pro',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff3669FF)),
                  ),
                ],
              ),
              SizedBox(height: 32),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.temple_buddhist),
                        const SizedBox(width: 16),
                        Text(
                          'Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
