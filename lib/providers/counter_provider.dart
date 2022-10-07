import 'package:riverpoduniversity/all_imports.dart';

//Make a global counterprovider to ref it whereever you go
final counterProvider = StateNotifierProvider<CounterState, int>((ref) {
  return CounterState();
});

//CounterState returns a starting value (0) and +1
//every time the function gets called.
class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void addOneOnClick() {
    state++;
  }
}
