import 'package:riverpoduniversity/all_imports.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      //Extracted appbar and drawer to separate
      //widgets, because I wanted to see if I
      //could. Short answer: yes.
      appBar: appbarWidget,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              //Watch the counterProvider and
              //show the value the provider provides.
              ref.watch(counterProvider).toString(),
              style: const TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //See counter_provider.dart. I've made a function
          //on CounterState() class that adds 1 every click.
          //Please note I use ref.READ here because you're
          //actually changing state, not just watching it
          ref.read(counterProvider.notifier).addOneOnClick();
        },
        tooltip: 'Guess what. This adds 1.',
        child: const Icon(Icons.add),
      ),
    );
  }
}
