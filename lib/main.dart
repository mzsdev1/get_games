// //todo2

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get_games/firebase_options.dart';
// import 'package:get_games/providers/theme_provider.dart';
// import 'package:get_games/views/homepage.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// //todo.

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     const ProviderScope(
//       child: App(),
//     ),
//   );
// }

// class App extends ConsumerWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final themeModeIndex = ref.watch(themeIndexProvider);

//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Get Games',
//           theme: FlexThemeData.light(
//             scheme: FlexScheme.tealM3,
//             surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//             blendLevel: 7,
//             subThemesData: const FlexSubThemesData(
//               blendOnLevel: 10,
//               blendOnColors: false,
//               useTextTheme: true,
//               useM2StyleDividerInM3: true,
//               alignedDropdown: true,
//               useInputDecoratorThemeInDialogs: true,
//               navigationBarLabelBehavior:
//                   NavigationDestinationLabelBehavior.alwaysHide,
//             ),
//             visualDensity: FlexColorScheme.comfortablePlatformDensity,
//             useMaterial3: true,
//             swapLegacyOnMaterial3: true,
//             fontFamily: GoogleFonts.poppins().fontFamily,
//           ),
//           darkTheme: FlexThemeData.dark(
//             scheme: FlexScheme.tealM3,
//             surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//             blendLevel: 13,
//             subThemesData: const FlexSubThemesData(
//               blendOnLevel: 20,
//               useTextTheme: true,
//               useM2StyleDividerInM3: true,
//               alignedDropdown: true,
//               useInputDecoratorThemeInDialogs: true,
//               navigationBarLabelBehavior:
//                   NavigationDestinationLabelBehavior.alwaysHide,
//             ),
//             visualDensity: FlexColorScheme.comfortablePlatformDensity,
//             useMaterial3: true,
//             swapLegacyOnMaterial3: true,
//             fontFamily: GoogleFonts.poppins().fontFamily,
//           ),
//           themeMode: themeModeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
//           home: child,
//         );
//       },
//       child: const HomePage(),
//     );
//   }
// }

//todo2

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_games/firebase_options.dart';
import 'package:get_games/providers/theme_provider.dart';
import 'package:get_games/views/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//todo.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeIndex = ref.watch(themeIndexProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // designSize: Size(
      //     MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Get Games',
          theme: FlexThemeData.light(
            scheme: FlexScheme.tealM3,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 10,
              blendOnColors: false,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              alignedDropdown: true,
              useInputDecoratorThemeInDialogs: true,
              navigationBarLabelBehavior:
                  NavigationDestinationLabelBehavior.alwaysHide,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.tealM3,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              alignedDropdown: true,
              useInputDecoratorThemeInDialogs: true,
              navigationBarLabelBehavior:
                  NavigationDestinationLabelBehavior.alwaysHide,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          themeMode: themeModeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
          builder: (context, widget) {
            return MediaQuery(

                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!);
          },
          home: child,
        );
      },
      child: const HomePage(),
      //child: const HomePage(),
    );
  }
}
