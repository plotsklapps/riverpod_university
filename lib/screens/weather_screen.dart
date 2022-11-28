import 'package:riverpoduniversity/all_imports.dart';

final cityNameProvider = StateProvider<String>((ref) {
  return '⬆️ Start Here ⬆️';
});

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final TextEditingController citySearchController = TextEditingController();
  bool searchIsVisible = false;

  @override
  void dispose() {
    citySearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String cityName = ref.watch(cityNameProvider);
    return SafeArea(
      child: Scaffold(
        appBar: appbarWidget,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/weather_background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(
                  'Your current position on earth...',
                ),
                ElevatedButton(
                  onPressed: () async {
                    await GeoLocator().getLocation();
                  },
                  child: const Text(
                    'Show my current position on earth!',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cityName,
                        style: const TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      Visibility(
                        visible: searchIsVisible,
                        child: IconButton(
                          onPressed: () async {
                            await GeoLocator().getLocation();
                          },
                          icon: const Icon(
                            Icons.search_outlined,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}