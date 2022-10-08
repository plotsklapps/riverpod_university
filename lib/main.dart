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
    ThemeData themeLight = FlexThemeData.light(
      scheme: ref.watch(themeColorProvider),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 26,
      appBarOpacity: 0.85,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        unselectedToggleIsColored: true,
        dialogBackgroundSchemeColor: SchemeColor.background,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.questrial().fontFamily,
    );
    ThemeData themeDark = FlexThemeData.dark(
      scheme: ref.watch(themeColorProvider),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
        unselectedToggleIsColored: true,
        dialogBackgroundSchemeColor: SchemeColor.background,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.questrial().fontFamily,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod University',
      //Watch the themeModeProvider, take the bool and return the
      //correct theme according to flexcolorscheme.dart
      theme: ref.watch(themeModeProvider) ? themeLight : themeDark,
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
          child: const Icon(Icons.add),
          tooltip: 'Guess what. This adds 1.',
        ),
      ),
    );
  }
}
