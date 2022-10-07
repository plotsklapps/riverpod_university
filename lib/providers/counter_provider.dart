import 'package:riverpoduniversity/all_imports.dart';

final counterProvider = StateNotifierProvider<CounterState, int>((ref) {
  return CounterState();
});

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void addOneOnClick() {
    state++;
  }
}
