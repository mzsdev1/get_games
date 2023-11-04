// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/constants/enums/locales.dart';
// import 'package:get_games/localizations/init_localization.dart';
// import 'package:get_games/localizations/locale_keys.g.dart';
// import 'package:get_games/permission_status.dart';
// import 'package:get_games/providers/theme_provider.dart';
// import 'package:get_games/widgets/common/appbar_title_text.dart';
// import 'package:dash_flags/dash_flags.dart';
// import 'package:get_games/widgets/settings/switch_lang_tile.dart';
// import 'package:url_launcher/url_launcher.dart';

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

//     //

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(54.5.h),
//         child: AppBar(
//           surfaceTintColor: Colors.transparent,
//           title: AppBarTitleText(
//             text: LocaleKeys.settingsView_appBarTitle.tr(),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: REdgeInsets.symmetric(
//             vertical: 8,
//             horizontal: 12,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     LocaleKeys.settingsView_darkModeText.tr(),
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.sp,
//                         ),
//                   ),
//                   const Spacer(),
//                   Switch.adaptive(
//                     value: themeProvider,
//                     onChanged: (_) {
//                       ref.read(themeIndexProvider.notifier).toggleTheme();
//                     },
//                   ),
//                 ],
//               ),
//               // Divider(),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     LocaleKeys.settingsView_permissionsText.tr(),
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.sp,
//                         ),
//                   ),
//                   const Spacer(),
//                   OutlinedButton.icon(
//                     icon: Icon(
//                       Icons.done_all,
//                       size: 24.w,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                     label: Text(
//                       LocaleKeys.settingsView_acceptText.tr(),
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontSize: 14.sp,
//                           ),
//                     ),
//                     onPressed: () {
//                       status.acceptPermission(context);
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
//                     LocaleKeys.settingsView_contact.tr(),
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.sp,
//                         ),
//                   ),
//                   const Spacer(),
//                   OutlinedButton.icon(
//                     onPressed: () {
//                       final Uri emailLaunchUri = Uri(
//                         scheme: 'mailto',
//                         path: 'appsroved@gmail.com',
//                       );
//                       launchUrl(emailLaunchUri);
//                     },
//                     icon: Icon(
//                       Icons.mail_outline,
//                       size: 24.w,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                     label: Text(
//                       LocaleKeys.settingsView_sendText.tr(),
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontSize: 14.sp,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               const Divider(),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Center(
//                 child: Text(
//                   LocaleKeys.settingsView_languagesText.tr(),
//                   textAlign: TextAlign.start,
//                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15.sp,
//                       ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Column(
//                 children: [
//                   // Divider(),
//                   SwitchLangTile(
//                     language: Language.en_us,
//                     langCode: "en",
//                     countryCode: "US",
//                     langText: LocaleKeys.languagesTexts_englishText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.en,
//                       );
//                     },
//                   ),

//                   SwitchLangTile(
//                     language: Language.tr,
//                     langCode: "tr",
//                     countryCode: "TR",
//                     langText: LocaleKeys.languagesTexts_turkishText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.tr,
//                       );
//                     },
//                   ),
//                   // const Divider(),
//                   SwitchLangTile(
//                     language: Language.pt_br,
//                     langCode: "pt",
//                     countryCode: "BR",
//                     langText: LocaleKeys.languagesTexts_brazilianText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.pt,
//                       );
//                     },
//                   ),
//                   // const Divider(),
//                   SwitchLangTile(
//                     language: Language.es,
//                     langCode: "es",
//                     countryCode: "ES",
//                     langText: LocaleKeys.languagesTexts_spanishText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.es,
//                       );
//                     },
//                   ),
//                   // const Divider(),
//                   SwitchLangTile(
//                     language: Language.fr,
//                     langCode: "fr",
//                     countryCode: "FR",
//                     langText: LocaleKeys.languagesTexts_frenchText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.fr,
//                       );
//                     },
//                   ),
//                   // const Divider(),
//                   SwitchLangTile(
//                     language: Language.de,
//                     langCode: "de",
//                     countryCode: "DE",
//                     langText: LocaleKeys.languagesTexts_germanText.tr(),
//                     onTap: () {
//                       InitLocalizations.updateLanguage(
//                         context: context,
//                         value: Locales.de,
//                       );
//                     },
//                   ),
//                   // const Divider(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//TODO TEST

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
import 'package:dash_flags/dash_flags.dart';
import 'package:get_games/widgets/settings/switch_lang_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeIndexProvider);
    final status = PermissionStatus();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: AppBarTitleText(
            text: LocaleKeys.settingsView_appBarTitle.tr(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    LocaleKeys.settingsView_darkModeText.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                  ),
                  const Spacer(),
                  Switch.adaptive(
                    value: themeProvider,
                    onChanged: (_) {
                      ref.read(themeIndexProvider.notifier).toggleTheme();
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        LocaleKeys.settingsView_permissionsText.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      OutlinedButton.icon(
                        icon: Icon(
                          Icons.done_all,
                          size: 24.w,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          LocaleKeys.settingsView_acceptText.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14.sp,
                              ),
                        ),
                        onPressed: () {
                          status.acceptPermission(context);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        LocaleKeys.settingsView_contact.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'appsroved@gmail.com',
                          );
                          launchUrl(emailLaunchUri);
                        },
                        icon: Icon(
                          Icons.mail_outline,
                          size: 24.w,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          LocaleKeys.settingsView_sendText.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14.sp,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  LocaleKeys.settingsView_languagesText.tr(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  // Divider(),
                  SwitchLangTile(
                    language: Language.en_us,
                    langCode: "en",
                    countryCode: "US",
                    langText: LocaleKeys.languagesTexts_englishText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.en,
                      );
                    },
                  ),

                  SwitchLangTile(
                    language: Language.tr,
                    langCode: "tr",
                    countryCode: "TR",
                    langText: LocaleKeys.languagesTexts_turkishText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.tr,
                      );
                    },
                  ),
                  // const Divider(),
                  SwitchLangTile(
                    language: Language.pt_br,
                    langCode: "pt",
                    countryCode: "BR",
                    langText: LocaleKeys.languagesTexts_brazilianText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.pt,
                      );
                    },
                  ),
                  // const Divider(),
                  SwitchLangTile(
                    language: Language.es,
                    langCode: "es",
                    countryCode: "ES",
                    langText: LocaleKeys.languagesTexts_spanishText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.es,
                      );
                    },
                  ),
                  // const Divider(),
                  SwitchLangTile(
                    language: Language.fr,
                    langCode: "fr",
                    countryCode: "FR",
                    langText: LocaleKeys.languagesTexts_frenchText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.fr,
                      );
                    },
                  ),
                  // const Divider(),
                  SwitchLangTile(
                    language: Language.de,
                    langCode: "de",
                    countryCode: "DE",
                    langText: LocaleKeys.languagesTexts_germanText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.de,
                      );
                    },
                  ),
                  // const Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
