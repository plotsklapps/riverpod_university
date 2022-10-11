import 'package:riverpoduniversity/all_imports.dart';

//Make a global counterprovider to ref it wherever you go
final themeColorStringProvider =
    StateNotifierProvider<ThemeColorString, String>((ref) {
  return ThemeColorString();
});

//ThemeColorString returns a starting value (Outer Space)
//of type String and has four functions to change this
//value accordingly.
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