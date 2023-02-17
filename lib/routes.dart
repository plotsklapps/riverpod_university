import 'package:riverpoduniversity/all_imports.dart';

//I like my navigation clean and tidy. I always create
//a separate dart file for my named routes so main.dart
//looks crisp.

Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) {
    return const HomeScreen();
  },
  'home_screen': (BuildContext context) {
    return const HomeScreen();
  },
  'counter_screen': (BuildContext context) {
    return const CounterScreen();
  },
  'weather_screen': (BuildContext context) {
    return const WeatherScreen();
  }
};
