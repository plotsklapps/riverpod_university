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
      //Watch Providers for light and dark, user decides in app
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themeDarkProvider),
      //Watch the themeModeProvider and return ThemeMode.system
      //in first instance. After that, user decides and controls
      //the themeMode via themeDataProvider
      themeMode: ref.watch(themeModeProvider),
      initialRoute: '/',
      routes: customRoutes,
    );
  }
}
