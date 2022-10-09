import 'package:riverpoduniversity/all_imports.dart';

final themeColorStringProvider =
    StateNotifierProvider<ThemeColorString, String>((ref) {
  return ThemeColorString();
});

class ThemeColorString extends StateNotifier<String> {
  ThemeColorString() : super('Outer Space');

  void setThemeColorStringOuterSpace() {
    state = 'Outer Space';
  }

  void setThemeColorStringBlueDelight() {
    state = 'Blue Delight';
  }

  void setThemeColorStringGreenMoney() {
    state = 'Green Money';
  }

  void setThemeColorStringRedWine() {
    state = 'Red Red Wine';
  }
}
