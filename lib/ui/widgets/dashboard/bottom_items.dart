import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomItems {
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
}
