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
        preferredSize: Size.fromHeight(56.h),
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
                    "Dark Mode",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                  const Spacer(),

                  //todo
                  Switch(
                    thumbIcon: themeProvider == 0
                        ? MaterialStateProperty.resolveWith(
                            (states) => const Icon(Icons.close),
                          )
                        : MaterialStateProperty.resolveWith(
                            (states) => const Icon(Icons.check),
                          ),
                    value: themeProvider == 0 ? false : true,
                    onChanged: (_) {
                      ref.read(themeIndexProvider.notifier).toggleTheme();
                    },
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
