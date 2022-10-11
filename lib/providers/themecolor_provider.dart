import 'package:riverpoduniversity/all_imports.dart';

//Make a global counterprovider to ref it whereever you go
final themeColorProvider =
    StateNotifierProvider<ThemeColorState, FlexScheme>((ref) {
  return ThemeColorState();
});

//ThemeColorState returns a starting value (FlexScheme.outerSpace)
//of type FlexScheme and has four functions to change this value
//accordingly.
class ThemeColorState extends StateNotifier<FlexScheme> {
  ThemeColorState() : super(FlexScheme.outerSpace);

  void setThemeOuterSpace() {
    state = FlexScheme.outerSpace;
  }

  void setThemeBlueDelight() {
    state = FlexScheme.blue;
  }

  void setThemeGreenMoney() {
    state = FlexScheme.money;
  }

  void setThemeRedWine() {
    state = FlexScheme.redWine;
  }
}
