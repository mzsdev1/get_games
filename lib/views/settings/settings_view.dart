import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/constants/enums/locales.dart';
import 'package:get_games/localizations/init_localization.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
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
          title: AppBarTitleText(
            text: LocaleKeys.settingsView_appBarTitle.tr(),
          ),
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
                    //Todo: dark mode text translate
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
                    LocaleKeys.settingsView_permissionsText.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    child: Text(
                      LocaleKeys.settingsView_acceptText.tr(),
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
              Text(
                LocaleKeys.settingsView_languagesText.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("English"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.en);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("Turkish"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.tr);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("Brazillian"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.pt);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("Spanish"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.es);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("French"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.fr);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: const Text("German"),
                    trailing: Icon(Icons.flashlight_off),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                          context: context, value: Locales.de);
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
