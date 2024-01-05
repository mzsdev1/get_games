import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/game_search/game_search_api_provider.dart';

class SearchQueryHandler {
  String currentText = '';
  Timer? debounceTimer;

  void handleTextChange(String value, WidgetRef ref) {
    final trimmedText = value.trim();
    final isMatch = RegExp(r'[a-zA-Z0-9 ]').hasMatch(trimmedText);

    if (trimmedText.isNotEmpty &&
        trimmedText.length <= 40 &&
        trimmedText.length >= 3 &&
        isMatch) {
      currentText = trimmedText;
      _debounceUpdate(ref);
    }
  }

  void _debounceUpdate(WidgetRef ref) {
    debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 600), () {
      ref.read(searchQueryProvider.notifier).state = currentText;
    });
  }
}
