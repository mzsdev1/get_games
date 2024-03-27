import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/utils/constants/enums/locales.dart';
import 'package:get_games/utils/helper/settings_tile_functions.dart';
import 'package:get_games/localizations/init_localization.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/utils/helper/notification_permission_status.dart';
import 'package:get_games/providers/theme/theme_provider.dart';
import 'package:get_games/ui/widgets/common/appbar_title_text.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:get_games/ui/widgets/settings/settings_tile.dart';
import 'package:get_games/ui/widgets/settings/switch_lang_tile.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeIndexProvider);
    final status = NotificationPermissionStatus();
    final tileFunc = SettingsTileFunctions();

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
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsTile(
                subTitle: LocaleKeys.settingsView_darkModeText.tr(),
                title: LocaleKeys.settingsView_themeText.tr(),
                leadingIcon: Icons.dark_mode_outlined,
                trailing: Switch(
                    value: themeProvider,
                    onChanged: (_) {
                      ref.read(themeIndexProvider.notifier).toggleTheme();
                    }),
              ),
              SettingsTile(
                subTitle: LocaleKeys.settingsView_notificationText.tr(),
                title: LocaleKeys.settingsView_permissionsText.tr(),
                leadingIcon: Icons.notifications_outlined,
                onTap: () {
                  status.acceptPermission(context);
                },
              ),
              SettingsTile(
                subTitle: LocaleKeys.settingsView_privacyPolicyText.tr(),
                title: LocaleKeys.settingsView_privacyText.tr(),
                leadingIcon: Icons.privacy_tip_outlined,
                onTap: () {
                  tileFunc.redictPrivacyWepPage();
                },
              ),
              SettingsTile(
                subTitle: LocaleKeys.settingsView_eMailText.tr(),
                title: LocaleKeys.settingsView_contact.tr(),
                leadingIcon: Icons.mail_outline,
                onTap: () {
                  tileFunc.redictEmailWepPage();
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        LocaleKeys.settingsView_localizationText.tr(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 11.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 138.w,
                        ),
                        Icon(
                          Icons.translate_outlined,
                          size: 24.w,
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.settingsView_languagesText.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                children: [
                  SwitchLangTile(
                    language: Language.en_us,
                    locale: Locales.en.locale,
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
                    locale: Locales.tr.locale,
                    langText: LocaleKeys.languagesTexts_turkishText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.tr,
                      );
                    },
                  ),
                  SwitchLangTile(
                    language: Language.pt_br,
                    locale: Locales.pt.locale,
                    langText: LocaleKeys.languagesTexts_brazilianText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.pt,
                      );
                    },
                  ),
                  SwitchLangTile(
                    language: Language.es,
                    locale: Locales.es.locale,
                    langText: LocaleKeys.languagesTexts_spanishText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.es,
                      );
                    },
                  ),
                  SwitchLangTile(
                    language: Language.fr,
                    locale: Locales.fr.locale,
                    langText: LocaleKeys.languagesTexts_frenchText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.fr,
                      );
                    },
                  ),
                  SwitchLangTile(
                    language: Language.de,
                    locale: Locales.de.locale,
                    langText: LocaleKeys.languagesTexts_germanText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.de,
                      );
                    },
                  ),
                  SwitchLangTile(
                    language: Language.vi,
                    locale: Locales.vn.locale,
                    langText: LocaleKeys.languagesTexts_vietnameseText.tr(),
                    onTap: () {
                      InitLocalizations.updateLanguage(
                        context: context,
                        value: Locales.vn,
                      );
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
