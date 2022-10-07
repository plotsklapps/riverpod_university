import 'package:riverpoduniversity/all_imports.dart';

//Make a global counterprovider to ref it whereever you go
final themeProvider = StateNotifierProvider<ThemeState, bool>((ref) {
  return ThemeState();
});

//ThemeState returns a starting value (true) and
//has two functions to change this value accordingly.
class ThemeState extends StateNotifier<bool> {
  ThemeState() : super(true);

  void setLightTheme() {
    state = true;
  }

  void setDarkTheme() {
    state = false;
  }
}
