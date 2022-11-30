import 'package:riverpoduniversity/all_imports.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  bool latitudeIsLoaded = false;
  bool longitudeIsLoaded = false;
  dynamic weatherData;

  @override
  Widget build(BuildContext context) {
    double? latitude = ref.watch(latitudeProvider);
    double? longitude = ref.watch(longitudeProvider);

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
                    //Set variable latitude to double provided by latitudeProvider, when complete set latitudeIsLoaded to true to show Text()
                    latitude = await ref
                        .read(latitudeProvider.notifier)
                        .getLatitude()
                        .whenComplete(() => latitudeIsLoaded = true);
                    //Set variable longitude to double provided by longitudeProvider, when complete set longitudeIsLoaded to true to show Text()
                    longitude = await ref
                        .read(longitudeProvider.notifier)
                        .getLongitude()
                        .whenComplete(() => longitudeIsLoaded = true);
                    //Set variable weatherData to String provided by Json
                    weatherData = await ref
                        .read(weatherProvider.notifier)
                        .getWeatherData();
                    print(weatherData);
                  },
                  child: const Text(
                    'Retrieve current position & Weather forecast',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Text(
                  'Latitude:',
                  style: (TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Visibility(
                  visible: latitudeIsLoaded,
                  child: Text(
                    '$latitude',
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const Text(
                  'Longitude:',
                  style: (TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Visibility(
                  visible: longitudeIsLoaded,
                  child: Text(
                    '$longitude',
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Text(
                  weatherData.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}