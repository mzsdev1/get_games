import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_games/firebase_options.dart';
import 'package:get_games/view/homepage.dart';
import 'view/free_games/free_games_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get Games',
        theme: FlexThemeData.light(
            scheme: FlexScheme.blumineBlue, useMaterial3: true),
        darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.blumineBlue, useMaterial3: true),
        themeMode: ThemeMode.system,
        home: const HomePage() //const FreeGamesView(),
        );
  }
}
