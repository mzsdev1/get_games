import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/utils/constants/list_constants.dart';
import 'package:get_games/providers/dashboard/nav_bar_provider.dart';
import 'package:get_games/ui/widgets/dashboard/bottom_items.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndexProvider = ref.watch(navBarProvider);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 68.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: BottomItems().bottomNavItemList,
          currentIndex: navBarIndexProvider,
          onTap: (index) {
            ref.read(navBarProvider.notifier).state = index;
          },
        ),
      ),
      body: ListConstants.viewList[navBarIndexProvider],
    );
  }
}
