import 'package:riverpoduniversity/all_imports.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  //Method to change providerstates according to other providerstates
  Future<void> handleWeatherData(weatherData) async {
    //Particular weatherData from getWeatherData() into temperatureProvider<int?>
    ref.read(temperatureProvider.notifier).state =
        await weatherData['main']['temp'].toInt();
    //Particular weatherData from getWeatherData() into conditionProvider<int>
    ref.read(conditionProvider.notifier).state =
        await weatherData['weather'][0]['id'];
    //int from conditionProvider into weatherIconProvider<String?>
    ref.read(weatherIconProvider.notifier).state =
        Weather().getWeatherIcon(ref.watch(conditionProvider));
    //int? from temperatureProvider into getMessage(), result into weatherMessageProvider<String?>
    ref.read(weatherMessageProvider.notifier).state =
        Weather().getMessage(ref.watch(temperatureProvider));
    //Particular weatherData from getWeatherData() into cityNameProvider<String?>
    ref.read(cityNameProvider.notifier).state = await weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    //Setting variables according to latest Provider states
    dynamic weatherData = ref.watch(weatherProvider);
    double? latitude = ref.watch(latitudeProvider);
    double? longitude = ref.watch(longitudeProvider);
    // var futureLatitude = ref.watch(futureLatitudeProvider);
    // var futureLongitude = ref.watch(futureLongitudeProvider);
    int? temperature = ref.watch(temperatureProvider);
    String? weatherIcon = ref.watch(weatherIconProvider);
    String? weatherMessage = ref.watch(weatherMessageProvider);
    String? cityName = ref.watch(cityNameProvider);

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
                    //Call handleWeatherData() to retrieve new data for state
                    await handleWeatherData(weatherData);
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
                Text(
                  '$latitude',
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                //If you want to use the following code, you also need to uncomment the code in weather_provider.dart for futureLatitudeProvider
                // const Text(
                //   'Latitude with FutureProvider:',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // futureLatitude.when(
                //   data: (latitude) {
                //     return Text(
                //       latitude.toString(),
                //       style: const TextStyle(
                //         fontSize: 24.0,
                //       ),
                //     );
                //   },
                //   error: (error, stacktrace) {
                //     return Text(
                //       'Something went wrong... $error',
                //     );
                //   },
                //   loading: () {
                //     return const CircularProgressIndicator();
                //   },
                // ),
                const Text(
                  'Longitude:',
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
                //If you want to use the following code, you also need to uncomment the code in weather_provider.dart for futureLongitudeProvider
                // const Text(
                //   'Latitude with FutureProvider:',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // futureLongitude.when(
                //   data: (longitude) {
                //     return Text(
                //       longitude.toString(),
                //       style: const TextStyle(
                //         fontSize: 24.0,
                //       ),
                //     );
                //   },
                //   error: (error, stacktrace) {
                //     return Text(
                //       'Something went wrong... $error',
                //     );
                //   },
                //   loading: () {
                //     return const CircularProgressIndicator();
                //   },
                // ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    temperature != null
                        ? Text(
                            '$temperature°C',
                            style: const TextStyle(
                              fontSize: 48.0,
                            ),
                          )
                        : const Text(
                            'No data 🤷‍♂️',
                          ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    weatherIcon != null
                        ? Text(
                            weatherIcon,
                            style: const TextStyle(
                              fontSize: 64.0,
                            ),
                          )
                        : const Text(
                            'No data 🤷‍♂️',
                          ),
                  ],
                ),
                weatherMessage != null
                    ? Text(
                        weatherMessage,
                        style: const TextStyle(
                          fontSize: 24.0,
                        ),
                      )
                    : const Text(
                        'No data 🤷‍♂️',
                      ),
                cityName != null
                    ? Text(
                        cityName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      )
                    : const Text(
                        'No data 🤷‍♂️',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}