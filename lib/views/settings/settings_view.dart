import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/theme_provider.dart';
import 'package:get_games/widgets/common/appbar_title_text.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeIndexProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.h),
        child: AppBar(
          title: const AppBarTitleText(text: "Settings"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Theme Mode",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                  const Spacer(),
                  AnimatedToggleSwitch<int>.rolling(
                    height: 35.h,
                    current: themeProvider,
                    values: const [0, 1],
                    onChanged: (_) {
                      ref.read(themeIndexProvider.notifier).toggleTheme();
                    },
                    iconList: const [
                      Icon(
                        Icons.light_mode,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.dark_mode,
                        color: Colors.blueGrey,
                      ),
                    ],
                    style: const ToggleStyle(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
