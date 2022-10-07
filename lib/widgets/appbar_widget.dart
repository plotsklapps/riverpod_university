import 'package:riverpoduniversity/all_imports.dart';

PreferredSizeWidget appbarWidget = AppBar(
  title: const Text('Riverpod University'),
  centerTitle: true,
  actions: [
    Consumer(
      builder: (context, ref, child) {
        return IconButton(
          onPressed: () {
            ref.invalidate(counterProvider);
            ref.invalidate(themeProvider);
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
