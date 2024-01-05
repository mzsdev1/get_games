import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/list_constants.dart';

class SelectedFilterNotifier extends StateNotifier<List<String>> {
  SelectedFilterNotifier() : super(ListConstants.activeStoresList);

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

final selectedFilterProvider =
    StateNotifierProvider<SelectedFilterNotifier, List<String>>((ref) {
  return SelectedFilterNotifier();
});

final selectedTypeProvider =
    StateNotifierProvider<SelectedGameTypeNotifier, String>((ref) {
  return SelectedGameTypeNotifier();
});
