import 'package:riverpoduniversity/all_imports.dart';

//Make a global counterprovider to ref it wherever you go
final themeModeProvider = StateNotifierProvider<ThemeModeState, bool>((ref) {
  return ThemeModeState();
});

//ThemeState returns a starting value (true) of type bool
//and has two functions to change this value accordingly.
class ThemeModeState extends StateNotifier<bool> {
  ThemeModeState() : super(true);

  void setLightTheme() {
    state = true;
  }

  void setDarkTheme() {
    state = false;
  }
}