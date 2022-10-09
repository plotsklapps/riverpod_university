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
          title: Text(
              'Thememode: ${ref.read(themeModeProvider) ? 'Yang' : 'Yin'}'),
          trailing: Switch(
              //Watch the bool from theme_provider.dart
              value: ref.watch(themeModeProvider),
              //Pass value to callback
              onChanged: (value) {
                if (value == true) {
                  ref.read(themeModeProvider.notifier).setLightTheme();
                } else {
                  ref.read(themeModeProvider.notifier).setDarkTheme();
                }
              }),
        ),
        ListTile(
          title: Text('Themecolor: ${ref.watch(themeColorStringProvider)}'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(themeColorProvider.notifier).setThemeOuterSpace();
                ref
                    .read(themeColorStringProvider.notifier)
                    .setThemeColorStringOuterSpace();
              },
              child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(themeColorProvider.notifier).setThemeBlueDelight();
                ref
                    .read(themeColorStringProvider.notifier)
                    .setThemeColorStringBlueDelight();
              },
              child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(themeColorProvider.notifier).setThemeGreenMoney();
                ref
                    .read(themeColorStringProvider.notifier)
                    .setThemeColorStringGreenMoney();
              },
              child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.green,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(themeColorProvider.notifier).setThemeRedWine();
                ref
                    .read(themeColorStringProvider.notifier)
                    .setThemeColorStringRedWine();
              },
              child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
});
