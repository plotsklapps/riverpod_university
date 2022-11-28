import 'package:riverpoduniversity/all_imports.dart';

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