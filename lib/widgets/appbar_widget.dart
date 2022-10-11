import 'package:riverpoduniversity/all_imports.dart';

//An AppBar() is a PreferredSizeWidget()! Otherwise
//it won't work!
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
            ref.invalidate(counterProvider);
            ref.invalidate(themeModeProvider);
            ref.invalidate(themeColorProvider);
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