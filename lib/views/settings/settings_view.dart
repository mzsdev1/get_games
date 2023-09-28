import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 70,
                width: 310,
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 15,
                    children: [
                      Text(
                        "Theme Mode:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      AnimatedToggleSwitch<int>.rolling(
                        current: themeProvider,
                        values: const [0, 1],
                        onChanged: (_) {
                          ref.read(themeIndexProvider.notifier).toggleTheme();
                        },
                        iconList: const [
                          Icon(Icons.sunny),
                          Icon(Icons.dark_mode),
                        ],
                        // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
                        style: ToggleStyle(), // optional style settings
                        // many more parameters available
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
