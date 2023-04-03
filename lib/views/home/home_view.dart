import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:cmp_flutter_web/views/home/home_tabs/products_tab.dart';
import 'package:cmp_flutter_web/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const route = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var name = '';
  var _controller = SidebarXController(
      selectedIndex: localStorage.getInt('page') ?? 0, extended: true);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final user = StrapiUserModel.fromJson(localStorage.getString('user')!);
      name = user.user.username;
      _controller = SidebarXController(
          selectedIndex: localStorage.getInt('page') ?? 0, extended: true);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.textFieldBackColor,
      drawerScrimColor: Colors.transparent,
      body: Row(
        children: [
          SideBar(controller: _controller),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final pageTitle = _getTitleByIndex(_controller.selectedIndex);
                switch (_controller.selectedIndex) {
                  case 0:
                    return ListView.builder(
                      //   TODO : PRODUCTS TAB
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) => Container(
                        height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            bottom: 10, right: 10, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).canvasColor,
                          boxShadow: const [BoxShadow()],
                        ),
                      ),
                    );
                  case 1:
                    return const ProductsTab();
                  default:
                    return Text(
                      pageTitle,
                      style: theme.textTheme.headlineSmall,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Orders';
      case 1:
        return 'Products';
      case 2:
        return 'Customers';
      case 3:
        return 'Discounts';
      case 4:
        return 'Gift Cards';
      case 5:
        return 'Pricing';
      case 6:
        return 'Settings';
      default:
        return 'Not found page';
    }
  }
}
