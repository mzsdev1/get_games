import 'package:easy_localization/easy_localization.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get_games/firebase/options/firebase_options.dart';
import 'package:get_games/localizations/init_localization.dart';
import 'package:get_games/firebase/notifications/notification_initializer.dart';
import 'package:get_games/providers/theme/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ui/views/dashboard/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //TODO: Initialize firebase with your own "firebase_options.dart" or delete all components if you don't use it
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

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
        title: 'Get Games',
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
        themeMode: themeModeIndex == false ? ThemeMode.light : ThemeMode.dark,
        home: const Dashboard(),
      ),
    );
  }
}
