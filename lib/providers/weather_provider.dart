import 'package:riverpoduniversity/all_imports.dart';
//
// //Instantiates as null, can be changed by user
// final currentCityProvider = StateProvider<City?>((ref) {
//   return null;
// });
//
// //Watch currentCityProvider and call getWeather() with the corresponding city
// final FutureProvider<String> currentWeatherProvider = FutureProvider<String>(
//   (ref) {
//     final city = ref.watch(currentCityProvider);
//
//     if (city != null) {
//       return getWeather(city);
//     } else {
//       return '🤷‍♂️';
//     }
//   },
// );

class GeoLocator {
  Future<Position> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      printLocation();
    } else {
      getPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      getLocation();
    } else {
      getPermission();
    }
  }

  Future<void> printLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: const Duration(
        seconds: 10,
      ),
    );
    print(position);
  }
}