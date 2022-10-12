import 'package:riverpoduniversity/all_imports.dart';

//Make a global themeModeProvider to ref it wherever you go
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});