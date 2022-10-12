import 'package:riverpoduniversity/all_imports.dart';

void main() {
  //Somehow I think ensuring initialization has become mandatory?
  //Can't hurt.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    //Wrap MainEntry() with ProviderScope()
    const ProviderScope(
      child: MainEntry(),
    ),
  );
}

//Chose to use ConsumerWidget here, because I want to add
//more complexity to the main screen.
class MainEntry extends ConsumerWidget {
  const MainEntry({Key? key}) : super(key: key);

  @override
  //Add 'WidgetRef ref' to the build() method to gain
  //access to your providers (see providers folder)
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod University',
      //Watch the themeModeProvider and return ThemeMode.system
      //in first instance. After that, user decides and controls
      //the themeMode via themeDataProvider
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themeDarkProvider),
      themeMode: ref.watch(themeModeProvider),
      //SafeArea FTW. Makes your app evade notches and stuff
      home: SafeArea(
        child: Scaffold(
          //Extracted appbar and drawer to separate
          //widgets, because I wanted to see if I
          //could. Short answer: yes.
          appBar: appbarWidget,
          drawer: drawerWidget,
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
              ref.read(counterProvider.notifier).addOneOnClick();
            },
            tooltip: 'Guess what. This adds 1.',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}