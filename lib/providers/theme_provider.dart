import 'package:riverpoduniversity/all_imports.dart';

final themeProvider = StateNotifierProvider<ThemeState, bool>((ref) {
  return ThemeState();
});

class ThemeState extends StateNotifier<bool> {
  ThemeState() : super(true);

  void setLightTheme() {
    state = true;
  }

  void setDarkTheme() {
    state = false;
  }
}
