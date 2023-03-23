import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/providers/auth_provider.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      headerBuilder: (context, extended) => SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cmp_drawer_logo.png'),
            if (extended) const SizedBox(width: 8),
            if (extended)
              const Text(
                'Cloud Media Pro',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff3669FF)),
              ),
          ],
        ),
      ),
      items: [
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Orders',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.tag,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Products',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.user,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Customers',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.percent,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Discounts',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.gift,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Gift Cards',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.circleDollarToSlot,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Pricing',
          onTap: () {},
        ),
        SidebarXItem(
          iconWidget: const FaIcon(
            FontAwesomeIcons.gear,
            color: AppColors.lightBlueColor,
            size: 16,
          ),
          label: 'Settings',
          onTap: () {},
        ),
      ],
      theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(color: Colors.grey),
          selectedTextStyle: const TextStyle(
            color: AppColors.lightBlueColor,
            fontWeight: FontWeight.w600,
          ),
          itemTextPadding: const EdgeInsets.only(left: 24),
          selectedItemTextPadding: const EdgeInsets.only(left: 24),
          iconTheme: const IconThemeData(
            color: Colors.grey,
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: AppColors.lightBlueColor,
            size: 20,
          ),
          selectedItemDecoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1,
              offset: Offset.zero,
            ),
          ])),
      extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(right: 10),
          selectedItemDecoration: const BoxDecoration(
            color: Colors.transparent,
          )),
    );
  }
}
