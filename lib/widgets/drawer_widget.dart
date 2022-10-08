import 'package:riverpoduniversity/all_imports.dart';

Widget drawerWidget = Drawer(
  child: Column(
    children: [
      Image.asset('assets/riverpod_university_logo.png'),
      ListTile(
        title: const Text('Yin Yang switcher'),
        //Add Consumer() to get acces to refs, it wants a
        //builder: (BuildContext, WidgetRef, Widget?)
        trailing: (Consumer(
          builder: (context, ref, child) {
            return Switch(
                //Watch the bool from theme_provider.dart
                value: ref.watch(themeModeProvider),
                //Pass value to callback
                onChanged: (value) {
                  if (value == true) {
                    ref.read(themeModeProvider.notifier).setLightTheme();
                  } else {
                    ref.read(themeModeProvider.notifier).setDarkTheme();
                  }
                });
          },
        )),
      ),
      ListTile(
        title: const Text('Go Yang'),
        //Add Consumer() to get acces to refs, it wants a
        //builder: (BuildContext, WidgetRef, Widget?)
        trailing: Consumer(
          builder: ((context, ref, child) {
            return IconButton(
              onPressed: () {
                //Use the function from theme_provider.dart
                ref.read(themeModeProvider.notifier).setLightTheme();
              },
              icon: const Icon(Icons.light_mode),
              tooltip: 'Lightmode',
            );
          }),
        ),
      ),
      ListTile(
        title: const Text('Go Yin'),
        //Add Consumer() to get acces to refs, it wants a
        //builder: (BuildContext, WidgetRef, Widget?)
        trailing: Consumer(builder: (context, ref, child) {
          return IconButton(
            onPressed: () {
              //Use the function from theme_provider.dart
              ref.read(themeModeProvider.notifier).setDarkTheme();
            },
            icon: const Icon(Icons.dark_mode),
            tooltip: 'Darkmode',
          );
        }),
      ),
    ],
  ),
);
