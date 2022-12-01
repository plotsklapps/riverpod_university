import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpoduniversity/all_imports.dart';

const apiKey = 'fa5c9b4de78bd4575fb68f2ec0e78b19';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

//The FutureProvider and StateNotifierProvider below do the exact same thing, both return a double. FutureProvider has a .when() method which can be useful in the UI and is set when user enters the WeatherScreen(). StateNotifierProvider can be handled by user interaction in the WeatherScreen() (press on a button) and can easily be invalidated.

//Create provider that provides a future of type double for latitude
final FutureProvider<double?> futureLatitudeProvider =
    FutureProvider<double?>((ref) async {
  final Position position = await GeoLocator().getCurrentPosition();
  return position.latitude;
});

//Create provider that provides a future of type double for langitude
final FutureProvider<double?> futureLongitudeProvider =
    FutureProvider<double?>((ref) async {
  final Position position = await GeoLocator().getCurrentPosition();
  return position.longitude;
});

//Create provider that can dig in to Latitude class
final latitudeProvider = StateNotifierProvider<Latitude, double?>((ref) {
  return Latitude();
});

class Latitude extends StateNotifier<double?> {
  Latitude() : super(0.0);

  //Method to ONLY get the position.latitude (double)
  Future<double?> getLatitude() async {
    final Position position = await GeoLocator().getCurrentPosition();
    state = position.latitude;
    return state;
  }
}

//Create provider that can dig in to Longitude class
final longitudeProvider = StateNotifierProvider<Longitude, double?>((ref) {
  return Longitude();
});

class Longitude extends StateNotifier<double?> {
  Longitude() : super(0.0);

  //Method to ONLY get the position.longitude (double)
  Future<double?> getLongitude() async {
    final Position position = await GeoLocator().getCurrentPosition();
    state = position.longitude;
    return state;
  }
}

class GeoLocator {
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}

final weatherProvider = StateNotifierProvider<Weather, dynamic>((ref) {
  return Weather(
      latitude: ref.watch(latitudeProvider),
      longitude: ref.watch(longitudeProvider));
});

class Weather extends StateNotifier<dynamic> {
  double? latitude;
  double? longitude;

  Weather({this.latitude, this.longitude}) : super(null);

  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    return null;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}