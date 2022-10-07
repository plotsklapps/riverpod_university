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
//more complexity to the main screen soon.
class MainEntry extends ConsumerWidget {
  const MainEntry({Key? key}) : super(key: key);

  @override
  //Add 'WidgetRef ref' to the build() method to gain
  //acces to your providers (see providers folder)
  Widget build(BuildContext context, WidgetRef ref) {
    //Instantiate an instance of your provider, I write
    //what they are because I'm used to it.
    bool currentTheme = ref.watch(themeProvider);
    int currentCount = ref.watch(counterProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod University',
      //Take the bool and return the correct theme
      //according to flexcolorscheme.dart
      theme: currentTheme ? themeLight : themeDark,
      home: Scaffold(
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
                //Just show the value the provider provides.
                currentCount.toString(),
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
          child: const Icon(Icons.add),
          tooltip: 'Guess what. This adds 1.',
        ),
      ),
    );
  }
}
