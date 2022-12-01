import 'package:riverpoduniversity/all_imports.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  dynamic weatherData;
  int? temperature;
  String? weatherIcon;
  String? weatherMessage;
  String? cityName;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = Weather().getWeatherIcon(condition);
      weatherMessage = Weather().getMessage(temperature!);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double? latitude = ref.watch(latitudeProvider);
    double? longitude = ref.watch(longitudeProvider);
    var futureLatitude = ref.watch(futureLatitudeProvider);
    var futureLongitude = ref.watch(futureLongitudeProvider);

    return SafeArea(
      child: Scaffold(
        appBar: appbarWidget,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    print('Button pressed!');
                    //Set variable latitude to double provided by latitudeProvider
                    latitude =
                        await ref.read(latitudeProvider.notifier).getLatitude();
                    //Set variable longitude to double provided by longitudeProvider
                    longitude = await ref
                        .read(longitudeProvider.notifier)
                        .getLongitude();
                    //Set variable weatherData to String provided by Json
                    weatherData = await ref
                        .read(weatherProvider.notifier)
                        .getWeatherData();
                    updateUI(weatherData);
                  },
                  child: const Text(
                    'Retrieve current position & Weather forecast',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Text(
                  'Latitude with StateNotifierProvider:',
                  style: (TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Text(
                  '$latitude',
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const Text(
                  'Latitude with FutureProvider:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                futureLatitude.when(
                  data: (latitude) {
                    return Text(
                      latitude.toString(),
                      style: const TextStyle(
                        fontSize: 24.0,
                      ),
                    );
                  },
                  error: (error, stacktrace) {
                    return Text(
                      'Something went wrong... $error',
                    );
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
                const Text(
                  'Longitude with StateNotifierProvider:',
                  style: (TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Text(
                  '$longitude',
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const Text(
                  'Latitude with FutureProvider:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                futureLongitude.when(
                  data: (longitude) {
                    return Text(
                      longitude.toString(),
                      style: const TextStyle(
                        fontSize: 24.0,
                      ),
                    );
                  },
                  error: (error, stacktrace) {
                    return Text(
                      'Something went wrong... $error',
                    );
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    temperature != null
                        ? Text(
                            '$temperature°C',
                          )
                        : const Text(
                            'Huh?',
                          ),
                    weatherIcon != null
                        ? Text(weatherIcon!)
                        : const Text(
                            'Huh?',
                          ),
                  ],
                ),
                weatherMessage != null
                    ? Text('$weatherMessage')
                    : const Text(
                        'Huh?',
                      ),
                cityName != null
                    ? Text('$cityName')
                    : const Text(
                        'Huh?',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}