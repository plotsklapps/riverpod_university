import 'package:riverpoduniversity/all_imports.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
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
                    latitude =
                        await ref.read(latitudeProvider.notifier).getLatitude();
                    longitude = await ref
                        .read(longitudeProvider.notifier)
                        .getLongitude();
                  },
                  child: const Text(
                    'Retrieve current position & Weather forecast',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Latitude: $latitude',
                ),
                Text(
                  'Longitude: $longitude',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}