import 'package:riverpoduniversity/all_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MainEntry(),
    ),
  );
}

class MainEntry extends ConsumerWidget {
  const MainEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool currentTheme = ref.watch(themeProvider);
    int currentCount = ref.watch(counterProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod University',
      theme: currentTheme ? themeLight : themeDark,
      home: Scaffold(
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
                currentCount.toString(),
                style: const TextStyle(fontSize: 25.0),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).addOneOnClick();
          },
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
