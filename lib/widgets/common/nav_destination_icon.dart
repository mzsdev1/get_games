// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDestinationIcon extends StatelessWidget {
  const NavDestinationIcon({
    Key? key,
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
  }) : super(key: key);

  final String title;
  final IconData selectedIcon;
  final IconData unselectedIcon;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(
        selectedIcon,
        size: 24.w,
      ),
      icon: Icon(
        unselectedIcon,
        size: 24.w,
      ),
      label: title,
    );
  }
}


// NavigationDestination(
//             selectedIcon: Icon(Icons.redeem),
//             icon: Icon(Icons.redeem_outlined),
//             label: 'Game',
//           ),