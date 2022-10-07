import 'package:riverpoduniversity/all_imports.dart';

Widget drawerWidget = Drawer(
  child: Column(
    children: [
      Image.asset('assets/RiverpodUniversityLogo.png'),
      ListTile(
        title: const Text('Light me up!'),
        trailing: Consumer(
          builder: ((context, ref, child) {
            return IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).setLightTheme();
              },
              icon: const Icon(Icons.light_mode),
            );
          }),
        ),
      ),
      ListTile(
        title: const Text('Go to the Dark Side!'),
        trailing: Consumer(builder: (context, ref, child) {
          return IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).setDarkTheme();
            },
            icon: const Icon(Icons.dark_mode),
          );
        }),
      ),
    ],
  ),
);
