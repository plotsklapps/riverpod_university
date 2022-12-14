import 'package:riverpoduniversity/all_imports.dart';

Widget drawerWidget =
//Wrap the Drawer in a Consumer() to get access to refs,
//it needs a builder: (BuildContext, WidgetRef, Widget?)
    Consumer(builder: (context, ref, child) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          Image.asset('assets/riverpod_university_logo.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //WATCH the themeModeStringProvider here, it
              //returns the current String for the themeMode
              Text('Theme: ${ref.watch(themeModeStringProvider)}'),
              //Look down
              const ThemeModeSwitch(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //WATCH the themeColorStringProvider here, it
              //returns the current String for the themeColor
              Text('Color: ${ref.watch(themeColorStringProvider)}'),
              //Look down
              const ThemeColorSwitch(),
            ],
          ),
        ],
      ),
    ),
  );
});

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final List<bool> isSelected = [
      ref.watch(themeModeProvider) == ThemeMode.light,
      ref.watch(themeModeProvider) == ThemeMode.system,
      ref.watch(themeModeProvider) == ThemeMode.dark,
    ];

    return ToggleButtons(
      //The state of each button is controlled by isSelected,
      //which is a list of bools that determine if a button
      //is in an active, disabled, or selected state.
      //They are both correlated by their index in the list.
      //The length of isSelected has to match
      //the length of the children list.
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          //Set the state of themeModeProvider to ThemeMode.light
          //and set the String of themeModeStringProvider
          ref.read(themeModeProvider.state).state = ThemeMode.light;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringLight();
        } else if (newIndex == 1) {
          //Set the state of themeModeProvider to ThemeMode.system
          //and set the String of themeModeStringProvider
          ref.read(themeModeProvider.state).state = ThemeMode.system;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringSystem();
        } else {
          //Set the state of themeModeProvider to ThemeMode.dark
          //and set the String of themeModeStringProvider
          ref.read(themeModeProvider.state).state = ThemeMode.dark;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringDark();
        }
      },
      children: const [
        Icon(Icons.light_mode),
        Icon(Icons.phone_android),
        Icon(Icons.dark_mode),
      ],
    );
  }
}

class ThemeColorSwitch extends ConsumerWidget {
  const ThemeColorSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<bool> isSelected = [
      ref.watch(themeColorProvider) == FlexScheme.outerSpace,
      ref.watch(themeColorProvider) == FlexScheme.blue,
      ref.watch(themeColorProvider) == FlexScheme.money,
      ref.watch(themeColorProvider) == FlexScheme.redWine,
    ];

    return ToggleButtons(
      //The state of each button is controlled by isSelected,
      //which is a list of bools that determine if a button
      //is in an active, disabled, or selected state.
      //They are both correlated by their index in the list.
      //The length of isSelected has to match
      //the length of the children list.
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          //Set the state of themeColorProvider to Outer Space
          //and set the String of themeColorProvider
          ref.read(themeColorProvider.notifier).setThemeOuterSpace();
          ref
              .read(themeColorStringProvider.notifier)
              .setThemeColorStringOuterSpace();
        } else if (newIndex == 1) {
          //Set the state of themeColorProvider to Blue Delight
          //and set the String of themeColorProvider
          ref.read(themeColorProvider.notifier).setThemeBlueDelight();
          ref
              .read(themeColorStringProvider.notifier)
              .setThemeColorStringBlueDelight();
        } else if (newIndex == 2) {
          //Set the state of themeColorProvider to Green Money
          //and set the String of themeColorProvider
          ref.read(themeColorProvider.notifier).setThemeGreenMoney();
          ref
              .read(themeColorStringProvider.notifier)
              .setThemeColorStringGreenMoney();
        } else {
          //Set the state of themeColorProvider to Red Red Wine
          //and set the String of themeColorProvider
          ref.read(themeColorProvider.notifier).setThemeRedWine();
          ref
              .read(themeColorStringProvider.notifier)
              .setThemeColorStringRedWine();
        }
      },
      children: const [
        Icon(
          Icons.rocket_launch,
          color: Colors.grey,
        ),
        Icon(
          Icons.surfing,
          color: Colors.blue,
        ),
        Icon(
          Icons.payments,
          color: Colors.green,
        ),
        Icon(
          Icons.wine_bar,
          color: Colors.red,
        ),
      ],
    );
  }
}