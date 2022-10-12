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
              Text('Theme: ${ref.watch(themeModeStringProvider)}'),
              const ThemeModeSwitch(),
            ],
          ),
          Row(
            children: [
              Text('Color: ${ref.watch(themeColorStringProvider)}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  //Use ref.read here, you want to call a method
                  ref.read(themeColorProvider.notifier).setThemeOuterSpace();
                  ref
                      .read(themeColorStringProvider.notifier)
                      .setThemeColorStringOuterSpace();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomInk(
                  tileColor: outerSpaceColorsLight.primary,
                  borderColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  //Use ref.read here, you want to call a method
                  ref.read(themeColorProvider.notifier).setThemeBlueDelight();
                  ref
                      .read(themeColorStringProvider.notifier)
                      .setThemeColorStringBlueDelight();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomInk(
                  tileColor: blueDelightColorsLight.primary,
                  borderColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  //Use ref.read here, you want to call a method
                  ref.read(themeColorProvider.notifier).setThemeGreenMoney();
                  ref
                      .read(themeColorStringProvider.notifier)
                      .setThemeColorStringGreenMoney();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomInk(
                  tileColor: greenMoneyColorsLight.primary,
                  borderColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  //Use ref.read here, you want to call a method
                  ref.read(themeColorProvider.notifier).setThemeRedWine();
                  ref
                      .read(themeColorStringProvider.notifier)
                      .setThemeColorStringRedWine();
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomInk(
                  tileColor: redRedWineColorsLight.primary,
                  borderColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
});

class CustomInk extends StatelessWidget {
  final Color? borderColor;
  final Color? tileColor;

  const CustomInk({Key? key, this.tileColor, this.borderColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.0,
      width: 48.0,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: borderColor!),
        borderRadius: BorderRadius.circular(12.0),
        color: tileColor!,
      ),
    );
  }
}

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<bool> isSelected = [
      ref.watch(themeModeProvider) == ThemeMode.light,
      ref.watch(themeModeProvider) == ThemeMode.system,
      ref.watch(themeModeProvider) == ThemeMode.dark,
    ];

    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          ref.read(themeModeProvider.state).state = ThemeMode.light;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringLight();
        } else if (newIndex == 1) {
          ref.read(themeModeProvider.state).state = ThemeMode.system;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringSystem();
        } else {
          ref.read(themeModeProvider.state).state = ThemeMode.dark;
          ref.read(themeModeStringProvider.notifier).setThemeModeStringDark();
        }
      },
      children: const <Widget>[
        Icon(Icons.light_mode),
        Icon(Icons.phone_android),
        Icon(Icons.dark_mode),
      ],
    );
  }
}