import 'package:riverpoduniversity/all_imports.dart';

Widget drawerWidget = Drawer(
  child: Column(
    children: [
      Image.asset('assets/riverpod_university_logo.png'),
      //Wrap the ListTile in a Consumer() to get acces to refs,
      //it wants a builder: (BuildContext, WidgetRef, Widget?)
      Consumer(builder: (context, ref, child) {
        return ListTile(
          title: Text(
              'Current thememode: ${ref.read(themeModeProvider) ? 'Yang' : 'Yin'}'),
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
        );
      }),
      const ListTile(
        title: Text('Choose a themecolor:'),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(themeColorProvider.notifier).setThemeOuterSpace();
                },
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                child: const Text('Outer Space'),
              );
            },
          ),
          const SizedBox(height: 10.0),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(themeColorProvider.notifier).setThemeBlueDelight();
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: const Text('Blue Delight'),
              );
            },
          ),
          const SizedBox(height: 10.0),
          Consumer(builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(themeColorProvider.notifier).setThemeGreenMoney();
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text('Green Money'),
            );
          }),
          const SizedBox(height: 10.0),
          Consumer(builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(themeColorProvider.notifier).setThemeRedWine();
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Red Red Wine'),
            );
          }),
        ],
      ),
    ],
  ),
);
