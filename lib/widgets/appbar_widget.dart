import 'package:riverpoduniversity/all_imports.dart';

//An AppBar() is a PreferredSizeWidget()! Otherwise
//it won't work
PreferredSizeWidget appbarWidget = AppBar(
  title: const Text('Riverpod University'),
  centerTitle: true,
  actions: [
    //Wrap the IconButton() with a Consumer()
    //to get access to other Providers
    Consumer(
      builder: (context, ref, child) {
        return IconButton(
          onPressed: () {
            //Reset ALL providers to default
            ref.invalidate(counterProvider);
            ref.invalidate(themeModeProvider);
            ref.invalidate(themeColorProvider);
            ref.invalidate(currentCityProvider);
            ref.invalidate(currentWeatherProvider);
          },
          icon: const Icon(
            Icons.restart_alt,
          ),
          tooltip: 'Reset ALL Providers',
        );
      },
    ),
  ],
);
