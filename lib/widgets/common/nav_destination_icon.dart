// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NavDestinationIcon extends StatelessWidget {
//   const NavDestinationIcon({
//     Key? key,
//     required this.title,
//     required this.selectedIcon,
//     required this.unselectedIcon,
//   }) : super(key: key);

//   final String title;
//   final IconData selectedIcon;
//   final IconData unselectedIcon;

//   @override
//   Widget build(BuildContext context) {
//     return NavigationDestination(
//       selectedIcon: Icon(
//         selectedIcon,
//         size: 24.w,
//       ),
//       icon: Icon(
//         unselectedIcon,
//         size: 24.w,
//       ),
//       label: title,
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first

final bottomNavItemList = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.redeem_outlined,
      size: 24.w,
    ),
    activeIcon: Icon(
      Icons.redeem,
      size: 24.w,
    ),
    label: "Free",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.discount_outlined,
      size: 24.w,
    ),
    activeIcon: Icon(
      Icons.discount,
      size: 24.w,
    ),
    label: "Deals",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.search_outlined,
      size: 24.w,
    ),
    activeIcon: Icon(
      Icons.search,
      size: 24.w,
    ),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.favorite_border,
      size: 24.w,
    ),
    activeIcon: Icon(
      Icons.favorite,
      size: 24.w,
    ),
    label: "Favorites",
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings_outlined,
      size: 24.w,
    ),
    activeIcon: Icon(
      Icons.settings,
      size: 24.w,
    ),
    label: "Settings",
  ),
];

// class NavLink extends StatelessWidget {
//   const NavLink({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return NavigationDestination();
//   }
// }
