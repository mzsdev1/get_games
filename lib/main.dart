import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_games/firebase_options.dart';
import 'package:get_games/providers/theme_provider.dart';
import 'package:get_games/views/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

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
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Get Games',
//       theme: FlexThemeData.light(
//         scheme: FlexScheme.tealM3,
//         surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//         blendLevel: 7,
//         subThemesData: const FlexSubThemesData(
//           blendOnLevel: 10,
//           blendOnColors: false,
//           useTextTheme: true,
//           useM2StyleDividerInM3: true,
//           alignedDropdown: true,
//           useInputDecoratorThemeInDialogs: true,
//         ),
//         visualDensity: FlexColorScheme.comfortablePlatformDensity,
//         useMaterial3: true,
//         swapLegacyOnMaterial3: true,
//         // To use the Playground font, add GoogleFonts package and uncomment
//         fontFamily: GoogleFonts.notoSans().fontFamily,
//       ),
//       darkTheme: FlexThemeData.dark(
//         scheme: FlexScheme.tealM3,
//         surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//         blendLevel: 13,
//         subThemesData: const FlexSubThemesData(
//           blendOnLevel: 20,
//           useTextTheme: true,
//           useM2StyleDividerInM3: true,
//           alignedDropdown: true,
//           useInputDecoratorThemeInDialogs: true,
//         ),
//         visualDensity: FlexColorScheme.comfortablePlatformDensity,
//         useMaterial3: true,
//         swapLegacyOnMaterial3: true,
//         // To use the Playground font, add GoogleFonts package and uncomment
//         fontFamily: GoogleFonts.notoSans().fontFamily,
//       ),
// // If you do not have a themeMode switch, uncomment this line
// // to let the device system mode control the theme mode:
//       themeMode: themeModeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
//       home: const HomePage(),
//     );
//   }
// }

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Games',
      // Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
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
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
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
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      themeMode: themeModeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
