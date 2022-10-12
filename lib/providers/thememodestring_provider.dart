import 'package:riverpoduniversity/all_imports.dart';

//Make a global themeModeStringProvider to ref it wherever you go
final themeModeStringProvider =
    StateNotifierProvider<ThemeModeString, String>((ref) {
  return ThemeModeString();
});

//ThemeModeString returns a starting value (System)
//of type String and has three functions to change this
//value accordingly.
class ThemeModeString extends StateNotifier<String> {
  ThemeModeString() : super('System');

  void setThemeModeStringSystem() {
    state = 'System';
  }

  void setThemeModeStringLight() {
    state = 'Light';
  }

  void setThemeModeStringDark() {
    state = 'Dark';
  }
}