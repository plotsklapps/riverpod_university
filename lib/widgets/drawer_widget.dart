import 'package:riverpoduniversity/all_imports.dart';

Widget drawerWidget =
//Wrap the Drawer in a Consumer() to get acces to refs,
//it needs a builder: (BuildContext, WidgetRef, Widget?)
    Consumer(builder: (context, ref, child) {
  return Drawer(
    child: Column(
      children: [
        Image.asset('assets/riverpod_university_logo.png'),
        ListTile(
          //Use themeModeProvider's bool to return correct Text
          title: Text('Mode: ${ref.read(themeModeProvider) ? 'Yang' : 'Yin'}'),
          trailing: Switch(
              //Watch the bool from theme_provider.dart
              value: ref.watch(themeModeProvider),
              //Pass value to callback and call correct function
              onChanged: (value) {
                if (value == true) {
                  ref.read(themeModeProvider.notifier).setLightTheme();
                } else {
                  ref.read(themeModeProvider.notifier).setDarkTheme();
                }
              }),
        ),
        ListTile(
          //Use ref.watch here, you want to continuously update
          title: Text('Color: ${ref.watch(themeColorStringProvider)}'),
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