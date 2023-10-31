import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/permission_status.dart';
import 'package:get_games/providers/theme_provider.dart';
import 'package:get_games/widgets/common/appbar_title_text.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeIndexProvider);
    final status = PermissionStatus();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          title: const AppBarTitleText(text: "Settings"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
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
                    // thumbIcon: themeProvider == false
                    //     ? MaterialStateProperty.resolveWith(
                    //         (states) => const Icon(Icons.close),
                    //       )
                    //     : MaterialStateProperty.resolveWith(
                    //         (states) => const Icon(Icons.check),
                    //       ),
                    value: themeProvider,
                    onChanged: (_) {
                      ref.read(themeIndexProvider.notifier).toggleTheme();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Permissions",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    child: const Text(
                      "Accept",
                    ),
                    onPressed: () {
                      status.acPerm();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: Text("English"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {},
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

//test trot
// @RoutePage()
// class SettingsView extends ConsumerStatefulWidget {
//   const SettingsView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
// }

// class _SettingsViewState extends ConsumerState<SettingsView> {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = ref.watch(themeIndexProvider);
//     final status = PermissionStatus();

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(54.5.h),
//         child: AppBar(
//           title: const AppBarTitleText(text: "Settings"),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: REdgeInsets.symmetric(
//             vertical: 8,
//             horizontal: 12,
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "Dark Mode",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16.sp,
//                         ),
//                   ),
//                   const Spacer(),

//                   //todo
//                   Switch(
//                     // thumbIcon: themeProvider == false
//                     //     ? MaterialStateProperty.resolveWith(
//                     //         (states) => const Icon(Icons.close),
//                     //       )
//                     //     : MaterialStateProperty.resolveWith(
//                     //         (states) => const Icon(Icons.check),
//                     //       ),
//                     value: themeProvider,

//                     onChanged: (_) {
//                       ref.read(themeIndexProvider.notifier).toggleTheme();
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Permissions",
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16.sp,
//                         ),
//                   ),
//                   const Spacer(),
//                   OutlinedButton(
//                     child: const Text(
//                       "Accept",
//                     ),
//                     onPressed: () {
//                       status.acPerm();
//                     },
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
