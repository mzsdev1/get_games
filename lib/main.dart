import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_games/ui/views/ad_ump/ad_ump_init_view.dart';
import 'package:get_games/services/firebase_service/firebase_options.dart';
import 'package:get_games/localizations/init_localization.dart';
import 'package:get_games/services/notification_service/notification_service.dart';
import 'package:get_games/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ui/views/dashboard/dashboard.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MobileAds.instance.initialize();
  await NotificationService().initNotifications();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ProviderScope(
      child: InitLocalizations(
        child: const App(),
      ),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeIndex = ref.watch(themeIndexProvider);
    final appTheme = AppTheme();

    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Game Castle',
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
        themeMode: themeModeIndex == false ? ThemeMode.light : ThemeMode.dark,
        home: const InitializeScreen(
          targetWidget: DashboardView(),
        ),
      ),
    );
  }
}
