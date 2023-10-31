import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedFilterNotifier extends StateNotifier<List<String>> {
  SelectedFilterNotifier() : super(["epic-games-store", "steam", "gog"]);

  void toggleFilter(String filter) {
    state = [...state];

    if (state.contains(filter)) {
      state.remove(filter);
    } else {
      state.add(filter);
    }
  }
}

class SelectedGameTypeNotifier extends StateNotifier<String> {
  SelectedGameTypeNotifier() : super("game");

  void setSelectedGameType(String value) {
    state = value;
  }
}

final selectedFiltersProvider =
    StateNotifierProvider<SelectedFilterNotifier, List<String>>((ref) {
  return SelectedFilterNotifier();
});

final selectedGameTypeProvider =
    StateNotifierProvider<SelectedGameTypeNotifier, String>((ref) {
  return SelectedGameTypeNotifier();
});
