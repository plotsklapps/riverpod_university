import 'package:riverpoduniversity/all_imports.dart';

//Instantiates as null, can be changed by user
final currentCityProvider = StateProvider<City?>((ref) {
  return null;
});

//Watch currentCityProvider and call getWeather() with the corresponding city
final FutureProvider<String> currentWeatherProvider = FutureProvider<String>(
  (ref) {
    final city = ref.watch(currentCityProvider);

    if (city != null) {
      return getWeather(city);
    } else {
      return '🤷‍♂️';
    }
  },
);
